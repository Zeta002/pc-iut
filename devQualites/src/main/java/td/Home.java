package td;

public class Home {
    private final String owner;
    private final String address;
    private final int surface;

    public Home(String owner, String address, int surface) {
        this.owner = owner;
        this.address = address;
        this.surface = surface;
    }

    public int tax(int amount) {
        return surface / amount;
    }

    @Override
    public String toString() {
        return "Home[owner=" + owner + ", address=" + address + ", " + "surface=" + surface + "]";
    }
}
