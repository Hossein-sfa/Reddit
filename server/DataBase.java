import java.io.*;
import java.util.*;
import java.time.LocalDateTime;

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
            String reply = elements[11];
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

    static public void addCommunity (association addCommunities , String json) throws Exception{
        FileWriter f1 = new FileWriter("DataBase/Communities1.txt" , true) ;
        FileWriter f2 = new FileWriter("DataBase/Communities2.txt" , true) ;
        FileWriter f3 = new FileWriter("DataBase/Communities3.txt" , true) ;
        FileWriter f4 = new FileWriter("DataBase/Communities4.txt" , true) ;
        FileWriter f5 = new FileWriter("DataBase/Communities5.txt" , true) ;
        FileWriter f6 = new FileWriter("DataBase/Communities6.txt" , true) ;
        if (addCommunities.Case.equals("Society & Life"))
            f1.append(json + "\n");
        if (addCommunities.Case.equals("Technology"))
            f2.append(json + "\n");
        if (addCommunities.Case.equals("Nature & Animals"))
            f3.append(json + "\n");
        if (addCommunities.Case.equals("Science"))
            f4.append(json + "\n");
        if (addCommunities.Case.equals("Sports"))
            f5.append(json + "\n");
        if (addCommunities.Case.equals("Entertainments"))
            f6.append(json + "\n"); 
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
        com.append("CommunityOfUser~" + usr.userName + ":" + json);
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
