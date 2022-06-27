import java.io.*;
import java.util.HashMap;

public class DataBase {
    HashMap<String, Controller> dataBase = new HashMap<>();
    static DataBase db;

    static public DataBase getDb() {
        if (db == null) {
            db = new DataBase();
        }
        return db;
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

    public Controller(String str) throws IOException {
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

    void removeId(String userName) {

    }
}