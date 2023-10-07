package td;

public class ProHome extends Home{
    private final double nbWorker;

    public ProHome(String owner, String address, int surface, int nbWorker) {
        super(owner, address, surface);
        this.nbWorker = nbWorker;
    }

    @Override
    public int tax(int amount) {
        return super.tax(amount) + (int) Math.floor(nbWorker / 10) * 150;
    }
}
