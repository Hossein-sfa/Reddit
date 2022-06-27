import java.io.*;
import java.net.Socket;

class Client {
    public static void main(String[] args) throws IOException {
            Socket socket = new Socket("localhost", 8080);
            OutputStream os = socket.getOutputStream();
            InputStream is = socket.getInputStream();
//            DataOutputStream dos = new DataOutputStream(os);
//            DataInputStream dis = new DataInputStream(is);
//            System.out.println(dis.readUTF());
//            dos.writeUTF("Hello from client");
//            ObjectOutputStream oos = new ObjectOutputStream(os);
//            ObjectInputStream ois = new ObjectInputStream(is);
//            Test t = (Test) ois.readObject();
    }
}
