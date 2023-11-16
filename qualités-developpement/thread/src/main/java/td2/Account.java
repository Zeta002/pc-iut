package td2;

public class Account {
    private int balance = 100;

    public int getBalance() {
        return balance;
    }

    public void setBalance(int amount) {
        if ((balance -= amount) <= 0) {
            System.err.println("There is not enough balance for that action.");
            System.out.println(balance);
        }
        balance -= amount;
        System.out.println(balance);
    }

    public synchronized void withdraw(int amount) {
        balance -= amount;
    }
}
