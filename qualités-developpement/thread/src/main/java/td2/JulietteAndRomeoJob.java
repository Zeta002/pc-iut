package td2;

public class JulietteAndRomeoJob implements Runnable {
    private String name;
    private Account account;

    public JulietteAndRomeoJob(String name, Account account) {
        this.name = name;
        this.account = account;
    }

    public void run() {
        for (int i = 0; i < 10; i++) {
            doWithdraw(10);
        }
    }

    public void doWithdraw(int amount) {
        if (account.getBalance() <= 0) {
            System.err.println("The balance is null or negative.");
            return;
        }

        System.out.println(account.getBalance());

        try {
            Thread.sleep(500);
        } catch (InterruptedException e) {
            throw new RuntimeException(e);
        }

        account.withdraw(amount);
        System.out.println(name);
    }
}
