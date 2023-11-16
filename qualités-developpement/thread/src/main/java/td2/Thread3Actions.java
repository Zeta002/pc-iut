package td2;

public class Thread3Actions extends Thread {
    private String name;

    public Thread3Actions(String name) {
        this.name = name;
    }
    public void run() {
        Thread3Actions t = new Thread3Actions(name);
        for (int i = 0; i < 10; i++) {
            try {
                Thread.sleep((int) (Math.random() * 200));
            } catch (InterruptedException e) {
                throw new RuntimeException(e);
            }

            System.out.println(name);
        }
    }
}
