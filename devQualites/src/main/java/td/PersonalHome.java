package td;

public class PersonalHome extends Home{
    private final int nbRoom;
    private final int livingSpace;
    private final boolean hasPool;

    public PersonalHome(String owner, String address, int surface, int nbRoom, int livingSpace, boolean hasPool) {
        super(owner, address, surface);
        this.nbRoom = nbRoom;
        if (livingSpace > surface)
            throw new RuntimeException("Does your house have more living space than surface? Wow, retry.");
        this.livingSpace = livingSpace;
        this.hasPool = hasPool;
    }

    @Override
    public int tax(int amount) {
        if (hasPool)
            return livingSpace / amount + nbRoom * 15 + 80;
        return livingSpace / amount + nbRoom * 15;
    }
}
