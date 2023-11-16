package td2;

public class Alphabet implements Runnable {

    public void run() {
        for (char i = 'a'; i <= 'z'; ++i) {
            System.out.println(i);
        }
    }
}
