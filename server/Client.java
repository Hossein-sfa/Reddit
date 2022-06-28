import java.io.*;
import java.net.Socket;

class Client {
    public static void main(String[] args) throws IOException {
            Socket socket = new Socket("localhost", 8080);
            OutputStream os = socket.getOutputStream();
            InputStream is = socket.getInputStream();
            DataOutputStream dos = new DataOutputStream(os);
            DataInputStream dis = new DataInputStream(is);
            dos.writeUTF("addpost~post5~this is post 5~sina~SBU~123~45~2003~01~1~11~12");
            dos.flush();
            System.out.println(dis.readUTF());
            socket.close();
//            ObjectOutputStream oos = new ObjectOutputStream(os);
//            ObjectInputStream ois = new ObjectInputStream(is);
//            Test t = (Test) ois.readObject();
    }
}
