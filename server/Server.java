import com.google.gson.GsonBuilder;
import java.time.LocalDateTime;
import com.google.gson.Gson;
import java.util.*;
import java.net.*;
import java.io.*;

class Server {
    public static void main(String[] args) throws IOException {
        ServerSocket serverSocket = new ServerSocket(8080);
        Vector<User> users = DataBase.usersLoader();
        Vector<Post> posts = DataBase.postsLoader();
        while (true) {
            System.out.println("Waiting for client...");
            new ClientHandler(serverSocket.accept(), users, posts).start();
        }
    }
}

class User {
    String email, userName, password;

    public User(String email, String userName, String password) {
        this.email = email;
        this.userName = userName;
        this.password = password;
    }
}

class Comment {
    String userName, description;
    int likes;
    LocalDateTime time;

    Comment(String userName, String description, int likes, LocalDateTime time) {
        this.userName = userName;
        this.description = description;
        this.likes = likes;
        this.time = time;
    }
}

class Post {
    String title, description, userName, community;
    int likes;
    Vector<Comment> comments;
    LocalDateTime time;

    public Post(String title, String description, String userName, String community, int likes, LocalDateTime time, Vector<Comment> comments) {
        this.title = title;
        this.description = description;
        this.userName = userName;
        this.community = community;
        this.likes = likes;
        this.time = time;
        this.comments = comments;
    }
}

class Association {
    String name;
    String Case;
    String title;
    String about;
    String image;
    String startDate;
    User associationMakerName;  //String json user
    int memberCount = 1;
    //  String users;
    List<User> users;
    List<Post> posts;

    public static Association fromJson(String json) {
        return new Gson().fromJson(json, Association.class);
    }

    public Association(String name, String Case, String title, String about, String image , String startDate , User associationMakerName) {
        this.name = name;
        this.Case = Case;
        this.title = title;
        this.about = about;
        this.image = image;
        this.startDate = startDate ;
        this.associationMakerName = associationMakerName ;
    }
}


class ClientHandler extends Thread {
    Socket socket;
    DataOutputStream dos;
    DataInputStream dis;
    Vector<User> users;
    Vector<Post> posts;

    public ClientHandler(Socket socket, Vector<User> users, Vector<Post> posts) throws IOException {
        this.socket = socket;
        this.users = users;
        this.posts = posts;
        dos = new DataOutputStream(socket.getOutputStream());
        dis = new DataInputStream(socket.getInputStream());
        System.out.println("user created");
    }

    // convert sever message to string
    public String listener() throws IOException {
        StringBuilder sb = new StringBuilder();
        int b = dis.read();
        while (b != 0) {
            sb.append((char) b);
            b = dis.read();
        }
        return sb.toString();
    }

    // send the response to server
    public void writer(String write) throws IOException {
        dos.writeBytes(write);
        dos.flush();
        dos.close();
        dis.close();
        socket.close();
        System.out.println(write);
    }

    @Override
    public void run() {
        super.run();
        String command;
        try {
            command = listener();
            // command = dis.readUTF();
            System.out.println("command: " + command);
        } catch (IOException e) {
            throw new RuntimeException(e);
        }
        String[] split = command.split("~");
        for (String s : split)
            System.out.println(s);
        switch (split[0]) {
            case "signin": {
                // if both userName and password are correct the response is 1
                // signin~userName~password
                boolean signedIn = false;
                for (User user : users) {
                    if (user.userName.equals(split[1])) {
                        if (user.password.equals(split[2])) {
                            System.out.println("signed in");
                            try {
                                writer("1");
                            } catch (IOException e) {
                                throw new RuntimeException(e);
                            }
                            signedIn = true;
                            break;
                        }
                    }
                }
                if (!signedIn) {
                    try {
                        System.out.println("not signed in");
                        writer("0");
                    } catch (IOException e) {
                        throw new RuntimeException(e);
                    }
                }
                break;
            }
            case "signup": {
                // checks the userName if it's taken, the response is zero and usr is not added
                // signup~email~userName~password
                boolean duplicate = false;
                String userName = split[2];
                for (User user : users) {
                    if (user.userName.equals(userName)) {
                        try {
                            writer("0");
                            duplicate = true;
                            break;
                        } catch (IOException e) {
                            throw new RuntimeException(e);
                        }
                    }
                }
                if (!duplicate) {
                    User user = new User(split[1], split[2], split[3]);
                    users.add(user);
                    try {
                        DataBase.addUser(user);
                        writer("1");
                    } catch (IOException e) {
                        throw new RuntimeException(e);
                    }
                }
                break;
            }
            case "addpost": {
                // addpost~title~description~user~community~like~year~month~day~hour~minute~username^description^likes/...
                LocalDateTime time = LocalDateTime.of(Integer.parseInt(split[6]), Integer.parseInt(split[7]), Integer.parseInt(split[8]), Integer.parseInt(split[9]), Integer.parseInt(split[10]));
                String reply = split[11];
                String[] separatedReplies = reply.split("/");
                Vector<Comment> comments = new Vector<>();
                for (String s : separatedReplies) {
                    String[] objects = s.split("\\^");
                    comments.add(new Comment(objects[0], objects[1], Integer.parseInt(objects[2]), LocalDateTime.now()));
                }
                Post newPost = new Post(split[1], split[2], split[3], split[4], Integer.parseInt(split[5]), time, comments);
                posts.add(newPost);
                try {
                    DataBase.addPost(newPost);
                    writer("1");
                } catch (IOException e) {
                    throw new RuntimeException(e);
                }
            }
            case "changeinfo": {
                // changeinfo~email~userName~password~newEmail~newUserName~newPassword
                String oldInfo = split[1] + "~" + split[2] + "~" + split[3];
                String newInfo = split[4] + "~" + split[5] + "~" + split[6];
                User oldUser = new User(split[1], split[2], split[3]);
                User newUser = new User(split[4], split[5], split[6]);
                for (User user : users) {
                    if (user.userName.equals(oldUser.userName)) {
                        users.remove(user);
                        users.add(newUser);
                        break;
                    }
                }
                try {
                    DataBase.changeInfo(oldInfo, newInfo);
                    writer("1");
                } catch (IOException e) {
                    throw new RuntimeException(e);
                }
                break;
            }
            case "addcommunities": {
                //addcommunities~JsonString => Json String must be converted to addCommunities object
                String json = split[1];
                Gson gson = new Gson();
                Association addCommunity = gson.fromJson(json, Association.class);
                String txt = addCommunity.about;
                //addcommunities~Name~case~title~about~image~time~headUser~userList~postList
                try {
                    writer("1");
                } catch (Exception e) {
                    System.out.println("Exception Occurred in adding Communities!!");
                }
                break;
            }
        }
    }
}
