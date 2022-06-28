import java.io.*;
import java.net.Socket;

public class Client {
    public static void main(String[] args) throws IOException {
            Socket socket = new Socket("localhost", 8080);
            OutputStream os = socket.getOutputStream();
            InputStream is = socket.getInputStream();
            DataOutputStream dos = new DataOutputStream(os);
            DataInputStream dis = new DataInputStream(is);
            dos.writeUTF("signin~hossein~12345678");
            dos.flush();
            System.out.println(dis.readUTF());
            socket.close();
    }
}
