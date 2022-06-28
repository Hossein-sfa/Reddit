import java.io.*;
import java.util.HashMap;
import java.util.Scanner;
import java.util.Vector;

public class DataBase {
    HashMap<String, Controller> dataBase = new HashMap<>();
    static DataBase db;

    static public DataBase getDb() {
        if (db == null) {
            db = new DataBase();
        }
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

    // load controllers from file
    static public Vector<Post> postsLoader () throws IOException {
        Vector<Post> posts = new Vector<>();
        BufferedReader reader = new BufferedReader(new FileReader("DataBase/users.txt"));
        String line = reader.readLine();
        while (line != null) {
            String[] elements = line.split("~");
            posts.add(new Post(elements[0], elements[1], elements[2], elements[3], Integer.parseInt(elements[4]), Integer.parseInt(elements[5])));
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