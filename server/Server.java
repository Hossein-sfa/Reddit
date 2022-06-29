import java.io.*;
import java.net.*;
import java.util.*;
import java.time.LocalDateTime;

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
    int likes, replyNum;
    LocalDateTime time = LocalDateTime.now();
    Vector<Comment> replies = new Vector<>();

    Comment(String userName, String description, int likes, int replyNum) {
        this.userName = userName;
        this.description = description;
        this.likes = likes;
        this.replyNum = replyNum;
    }
}

class Post {
    String title, description, userName, community;
    int likes, commentNum;
    Vector<Comment> comments;
    LocalDateTime time;

    public Post(String title, String description, String userName, String community, int likes, int commentNum, LocalDateTime time, Vector<Comment> comments) {
        this.title = title;
        this.description = description;
        this.userName = userName;
        this.community = community;
        this.likes = likes;
        this.commentNum = commentNum;
        this.time = time;
        this.comments = comments;
    }
}

class addCommunities {
    private final HashMap<String, String> data;
    public addCommunities(HashMap<String, String> data) {
        this.data = data;
    }
    public HashMap<String, String> getData() {
        return data;
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

    public void writer(String write) throws IOException {
        dos.writeUTF(write);
        dos.flush();
        System.out.println("write: " + write);
    }

    @Override
    public void run() {
        super.run();
        String command;
        try {
            //command = listener();
            command = dis.readUTF();
            System.out.println("command: " + command);
        } catch (IOException e) {
            throw new RuntimeException(e);
        }
        String[] split = command.split("~");
        for (String s : split) {
            System.out.println(s);
        }
        switch (split[0]) {
            case "signin" -> {
                boolean signedIn = false;
                for (User user : users) {
                    if (user.userName.equals(split[1])) {
                        if (user.password.equals(split[2])) {
                            try {
                                System.out.println("signed in");
                                writer("1");
                            } catch (IOException e) {
                                throw new RuntimeException(e);
                            }
                            signedIn = true;
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
            }
            case "signup" -> {
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
            }
            case "addpost" -> {
                // title~description~user~community~like~commentNum~year~month~day~hour~minute~username^likes^replies\...
                LocalDateTime time = LocalDateTime.of(Integer.parseInt(split[7]), Integer.parseInt(split[8]), Integer.parseInt(split[9]), Integer.parseInt(split[10]), Integer.parseInt(split[11]));
                String reply = split[11];
                String[] separatedReplies = reply.split("/");
                Vector<Comment> comments = new Vector<>();
                for (String s : separatedReplies) {
                    String[] objects = s.split("^");
                    comments.add(new Comment(objects[0], objects[1], Integer.parseInt(objects[2]), Integer.parseInt(objects[3])));
                }
                Post newPost = new Post(split[1], split[2], split[3], split[4], Integer.parseInt(split[5]), Integer.parseInt(split[6]), time, comments);
                posts.add(newPost);
                try {
                    DataBase.addPost(newPost);
                    writer("1");
                } catch (IOException e) {
                    throw new RuntimeException(e);
                }
            }
            case "changeinfo" -> {
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
            }
            case "addComunities" ->{
                //addComunities~Name~case~title~about~image~time~headUser~userList~postList
                HashMap<String, String> data ;
                addCommunities addCommunities;
                data = new HashMap<>(Map.of("name" , split[1] , "case" , split[2] ,
                        "title" , split[3] , "about" , split[4] , "image" , split[5] ,
                        "time" , split[6] , "headUser" , split[7] , "userList" , split[8] , "postList" , split[9]));
                addCommunities = new addCommunities(data);
                try{
                    writer("done");
                }
                catch (Exception e) {
                    System.out.println("Exception Occured in adding Communities!!");
                }
            }
        }
    }
}
