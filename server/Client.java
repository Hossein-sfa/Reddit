import java.io.*;
import java.net.Socket;

class Client {
    public static void main(String[] args) throws IOException {
            Socket socket = new Socket("localhost", 8080);
            OutputStream os = socket.getOutputStream();
            InputStream is = socket.getInputStream();
            DataOutputStream dos = new DataOutputStream(os);
            DataInputStream dis = new DataInputStream(is);
//            dos.writeUTF("changeinfo~hossaf82@gmail.com~hossein~12345678~hossaf82@gmail.com~hossein~kirekhar");
//            dos.flush();
//            System.out.println(dis.readUTF());
            socket.close();
//            ObjectOutputStream oos = new ObjectOutputStream(os);
//            ObjectInputStream ois = new ObjectInputStream(is);
//            Test t = (Test) ois.readObject();
    }
}
