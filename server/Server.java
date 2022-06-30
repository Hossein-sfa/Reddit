import com.google.gson.GsonBuilder;
import java.time.LocalDateTime;
import com.google.gson.Gson;
import java.util.*;
import java.net.*;
import java.io.*;
class DataBase {
    HashMap<String, Controller> dataBase = new HashMap<>();
    static DataBase db;

    static public DataBase getDb() {
        if (db == null)
            db = new DataBase();
        return db;
    }

    // load users from file
    static public Vector<User> usersLoader() throws IOException {
        Vector<User> users = new Vector<>();
        BufferedReader reader = new BufferedReader(new FileReader("DataBase/users.txt"));
        String line = reader.readLine();
        while (line != null) {
            String[] elements = line.split("~");
            users.add(new User(elements[0], elements[1], elements[2]));
            line = reader.readLine();
        }
        reader.close();
        return users;
    }

    // load posts from file
    static public Vector<Post> postsLoader () throws IOException {
        Vector<Post> posts = new Vector<>();
        BufferedReader reader = new BufferedReader(new FileReader("DataBase/posts.txt"));
        String line = reader.readLine();
        while (line != null) {
            // title~description~user~community~like~year~month~day~hour~minute~username^description^likes^replies/...
            String[] elements = line.split("~");
            Vector<Comment> comments = new Vector<>();
            LocalDateTime time = LocalDateTime.of(Integer.parseInt(elements[5]), Integer.parseInt(elements[6]), Integer.parseInt(elements[7]), Integer.parseInt(elements[8]), Integer.parseInt(elements[9]));
            String reply = elements[10];
            String[] separatedReplies = reply.split("/");
            for (String s : separatedReplies) {
                String[] objects = s.split("\\^");
                comments.add(new Comment(objects[0], objects[1], Integer.parseInt(objects[2]), time));
            }
            posts.add(new Post(elements[0], elements[1], elements[2], elements[3], Integer.parseInt(elements[4]), time, comments));
            line = reader.readLine();
        }
        reader.close();
        return posts;
    }

    // save new user to file
    static public void addUser(User user) throws IOException {
        BufferedWriter writer = new BufferedWriter(new FileWriter("DataBase/users.txt", true));
        writer.append(user.email).append("~").append(user.userName).append("~").append(user.password).append("\n");
        writer.close();
    }



    static public void deleteUser(String userName) throws IOException {
        File file = new File("DataBase/users.txt");
        File tempFile = new File("DataBase/temp.txt");
        BufferedReader reader = new BufferedReader(new FileReader(file));
        BufferedWriter writer = new BufferedWriter(new FileWriter(tempFile));
        String currentLine;
        while((currentLine = reader.readLine()) != null) {
            // trim newline when comparing with lineToRemove
            String trimmedLine = currentLine.trim();
            if(trimmedLine.contains(userName))
                continue;
            writer.write(currentLine + System.getProperty("line.separator"));
        }
        writer.close();
        reader.close();
        file.delete();
        boolean successful = tempFile.renameTo(file);
        System.out.println(successful);
    }

    // save new post to file
    static public void addPost(Post post) throws IOException {
        BufferedWriter writer = new BufferedWriter(new FileWriter("DataBase/posts.txt", true));
        writer.append(post.title).append("~").append(post.description).append("~").append(post.userName).append("~").append(post.community).append("~").append(String.valueOf(post.likes)).append("~").append(String.valueOf(post.time.getYear())).append("~").append(String.valueOf(post.time.getMonthValue())).append("~").append(String.valueOf(post.time.getDayOfMonth())).append("~").append(String.valueOf(post.time.getHour())).append("~").append(String.valueOf(post.time.getMinute()));
        for (Comment comment : post.comments)
            writer.append(comment.userName).append("^").append(comment.description).append("^").append(String.valueOf(comment.likes)).append("^").append(String.valueOf(comment.replies)).append("/");
        writer.append("\n");
        writer.close();
    }

    // saving changes user pass or email or userName
    static public void changeInfo(String oldLine, String newLine) throws IOException {
        Scanner scanner = new Scanner(new File("DataBase/users.txt"));
        StringBuilder buffer = new StringBuilder();
        while (scanner.hasNextLine())
            buffer.append(scanner.nextLine()).append(System.lineSeparator());
        String fileContents = buffer.toString();
        System.out.println("Contents of the file: "+fileContents);
        scanner.close();
        fileContents = fileContents.replaceAll(oldLine, newLine);
        FileWriter writer = new FileWriter("DataBase/users.txt");
        System.out.println("new data: " + fileContents);
        writer.append(fileContents);
        writer.flush();
        writer.close();
    }

    static public void addCommunity (Association addCommunities , String json) throws Exception{
        FileWriter f1 = new FileWriter("DataBase/Communities1.txt" , true) ;
        FileWriter f2 = new FileWriter("DataBase/Communities2.txt" , true) ;
        FileWriter f3 = new FileWriter("DataBase/Communities3.txt" , true) ;
        FileWriter f4 = new FileWriter("DataBase/Communities4.txt" , true) ;
        FileWriter f5 = new FileWriter("DataBase/Communities5.txt" , true) ;
        FileWriter f6 = new FileWriter("DataBase/Communities6.txt" , true) ;
        if (addCommunities.Case.equals("Society & Life"))
            f1.append(json).append("\n");
        if (addCommunities.Case.equals("Technology"))
            f2.append(json).append("\n");
        if (addCommunities.Case.equals("Nature & Animals"))
            f3.append(json).append("\n");
        if (addCommunities.Case.equals("Science"))
            f4.append(json).append("\n");
        if (addCommunities.Case.equals("Sports"))
            f5.append(json).append("\n");
        if (addCommunities.Case.equals("Entertainments"))
            f6.append(json).append("\n");
        f1.flush();
        f2.flush();
        f3.flush();
        f4.flush();
        f5.flush();
        f6.flush();
        f1.close();
        f2.close();
        f3.close();
        f4.close();
        f5.close();
        f6.close();
        User usr = addCommunities.associationMakerName ;
        FileWriter com = new FileWriter("DataBase/users.txt" , true) ;
        com.append("CommunityOfUser~").append(usr.userName).append(":").append(json);
        com.flush();
        com.close();
    }


    void addDataBase (String str, Controller c) {
        dataBase.put(str, c);
    }

    Controller getController(String str) {
        return dataBase.get(str);
    }
}

class Controller {
    File file;
    FileWriter fw;
    RandomAccessFile raf;

    public Controller(String str) {
        file = new File (str);
        try {
            raf = new RandomAccessFile(file, "rw");
            String last = readFile();
            fw = new FileWriter(file);
            writeFile(last);
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    String readFile() throws IOException {
        StringBuilder recovery = new StringBuilder();
        String i;
        while ((i = raf.readLine()) != null) {
            recovery.append(i).append("\n");
        }
        raf.seek(0);
        return recovery.toString();
    }

    void writeFile(String str, boolean ... reset) throws IOException {
        if (reset.length != 0) {
            fw = new FileWriter(file);
        }
        fw.write(str);
        fw.flush();
    }

    String getRow(String id) throws IOException {
        String[] split = this.readFile().split("\n");
        for (String str : split) {
            if (str.startsWith(id)) {
                return str;
            }
        }
        return "invalid";
    }
}


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
    Vector<Comment> replies;

    Comment(String userName, String description, int likes, LocalDateTime time) {
        this.userName = userName;
        this.description = description;
        this.likes = likes;
        this.time = time;
        replies = new Vector<>();
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
        System.out.println("write: " + write);
    }

    @Override
    public void run() {
        super.run();
        String command;
        try {
            // command = listener();
            command = dis.readUTF();
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
            }
            case "addcommunities": {
                //addcommunities~JsonString => Json String must be converted to addCommunities object
                String json = split[1];
                Gson gson = new Gson();
                Association addCommunity = gson.fromJson(json, Association.class);
                String txt = addCommunity.about;
            }
            //addcommunities~Name~case~title~about~image~time~headUser~userList~postList
            try {
                writer("1");
            } catch (Exception e) {
                System.out.println("Exception Occurred in adding Communities!!");
            }
        }
    }
}
