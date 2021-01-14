import java.util.Base64;
import java.io.InputStream;
import java.io.FileInputStream;
import java.security.MessageDigest;
 
public class MD5 {
    public static String fileToMD5(String file) {
        try {
            InputStream is = null;
            is = new FileInputStream(file);
            byte[] buffer = new byte[64*1024];
            MessageDigest hash;
            hash = MessageDigest.getInstance("MD5");
            int c = 0;
            for (int numRead = 0; (numRead = is.read(buffer)) > 0; ) {
                c+=numRead;
                hash.update(buffer, 0, numRead);
            }
            String computedhash = new String(Base64.getEncoder().encode(hash.digest()));
            is.close();
            return computedhash;
        } catch (Exception e){
            e.printStackTrace();
            System.out.println("error");
            return null;
        }
    }
 
    public static void main(String[] args) {
        if(args.length<1){
            System.out.println("missing args");
        }
        else{
            String md5 = fileToMD5(args[0]);
            System.out.print(md5);
        }
    }
}