import java.util.Random;
import java.math.BigInteger;

public class random {
    public static void main(String[] args) {
        if(args.length<2){
            System.out.println("missing args");
        }
        else{
            BigInteger bi = new BigInteger(args[0],2);
            long seed = Long.parseLong(bi.toString());
            Random r = new Random(seed);
            int size = Integer.parseInt(args[1]);
            for (int i = 0;i<size;i++){
                float f = r.nextFloat()*2-1;
                System.out.println(String.valueOf(f));
            }
        }
    }
}