package td2;

public class NumberList implements Runnable {

    public void run() {
        for (int i = 1; i <= 26; ++i) {
            System.out.println(i);
        }
    }
}
