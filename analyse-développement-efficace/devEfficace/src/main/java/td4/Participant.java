package td4;

public class Participant {
    private final String name;
    private final int age;
    private double score;

    public Participant(String name, int age) {
        this.name = name;
        this.age = age;
        this.score = Math.random() * 100;
    }

    public double getScore() {
        return score;
    }

    public void setScore(double score) {
        this.score = score;
    }

    public String getName() {
        return name;
    }

    public int getAge() {
        return age;
    }

    @Override
    public String toString() {
        return getClass().getSimpleName() + "[" + name + ", age=" + age + ", score=" + score + "]";
    }
}
