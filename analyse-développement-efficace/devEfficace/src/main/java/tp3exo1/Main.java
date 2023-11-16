package tp3exo1;

import java.util.ArrayList;
import java.util.Collections;

public class Main {
    public static void main(String[] args) {
        ArrayList<String> a = new ArrayList<>();
        a.add("blue");
        a.add("red");
        a.add("tan");
        a.add("teal");

        System.out.println(a);

        for (String color: a) {
            System.out.println(color);
        }

        a.add(0, "brown");
        System.out.println(a);

        String monElement = a.get(3);
        System.out.println(monElement);

        a.set(4, "tan");
        System.out.println(a);

        a.remove(2);
        System.out.println(a);

        System.out.println(a.indexOf("blue"));

        Collections.sort(a);
        System.out.println(a);

        ArrayList<String> b = new ArrayList<String>(a);
        System.out.println(b);

        Collections.shuffle(a);
        System.out.println(a);

        Collections.reverse(a);
        System.out.println(a);

        ArrayList<String> subListA = new ArrayList<String>(a.subList(1, 3));
        System.out.println(subListA);

        System.out.println(a.equals(b));
        System.out.println(a.equals(a));

        Collections.swap(a, 0, 3);
        System.out.println(a);

        a.clear();
        System.out.println(a);
    }
}
