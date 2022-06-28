import java.io.*;
import java.net.*;
import java.util.Vector;

class Server {
    public static void main(String[] args) throws IOException {
        ServerSocket serverSocket = new ServerSocket(8080);
        Vector<User> users = new Vector<>();
        users.add(new User("hossein", "hossaf82@gmail.com", "12345678"));
        users.add(new User("navid", "navid@yahoo.com", "@qweER1234!"));
        while(true) {
            System.out.println("Waiting for client...");
            new ClientHandler(serverSocket.accept(), users).start();
            Socket socket = serverSocket.accept();
            new ClientHandler(socket, users).start();
        }
    }
}

class User {
    String email, userName, password;

    public User(String email, String userName, String password) {
        this.userName = userName;
        this.email = email;
        this.password = password;
    }
}

class ClientHandler extends Thread {
    Socket socket;
    DataOutputStream dos;
    DataInputStream dis;
    Vector<User> users;
    public ClientHandler(Socket socket, Vector<User> users) throws IOException {
        this.socket = socket;
        this.users = users;
        dos = new DataOutputStream(socket.getOutputStream());
        dis = new DataInputStream(socket.getInputStream());
        System.out.println("user created");
    }

    public String listener() throws IOException {
        StringBuilder sb = new StringBuilder();
        while (dis.read() != '.') {
            sb.append((char) dis.read());
        }
        System.out.println(dis.readUTF());
        return sb.toString();
    }

    public void writer(String write) throws IOException {
        dos.writeUTF(write);
        System.out.println("write: " + write);
    }

    @Override
    public void run() {
        super.run();
        String command;
        try {
            command = listener();
            System.out.println("tamam");
            System.out.println("command: " + command);
        } catch (IOException e) {
            throw new RuntimeException(e);
        }
        String[] split = command.split(" ");
        for (String s : split) {
            System.out.println(s);
        }
        System.out.println();

        if (split[0].equals("signin")) {
            boolean signedIn = false;
            for (User user : users) {
                if (user.userName.equals(split[1])) {
                    if (user.password.equals(split[2])) {
                        try {
                            System.out.println("signed in");
                            writer("done");
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
                    writer("invalid");
                } catch (IOException e) {
                    throw new RuntimeException(e);
                }
            }
        } else if (split[0].equals("signup")) {
            boolean duplicate = false;
            String userName = split[1];
            for (User user : users) {
                if (user.userName.equals(userName)) {
                    try {
                        writer("invalid");
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
                    writer("done");
                } catch (IOException e) {
                    throw new RuntimeException(e);
                }
            }
        }
    }
}
//                OutputStream os = socket.getOutputStream();
//                InputStream is = socket.getInputStream();
//                DataOutputStream dos = new DataOutputStream(os);
//                DataInputStream dis = new DataInputStream(is);
//                dos.writeUTF("Hello from server");
//                dos.flush();
//                System.out.println(dis.readUTF());
//                dis.readInt();
//                dos.writeInt(10);
//                ObjectOutputStream oos = new ObjectOutputStream(os);
//                ObjectInputStream ois = new ObjectInputStream(is);
//                oos.writeObject(t);
//                oos.flush();