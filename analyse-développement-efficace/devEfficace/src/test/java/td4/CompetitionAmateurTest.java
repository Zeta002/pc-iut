package td4;

import java.util.ArrayList;

class CompetitionAmateurTest {

    @org.junit.jupiter.api.Test
    void competition() {
        Amateur a1 = new Amateur("Quentin", 19);
        Amateur a2 = new Amateur("Angelo", 18);
        Amateur a3 = new Amateur("Clément", 19);
        Amateur a4 = new Amateur("Aurore", 19);
        Amateur a5 = new Amateur("Valentin", 19);
        ArrayList<Amateur> playerList = new ArrayList<Amateur>();
        playerList.add(a1);
        playerList.add(a2);
        playerList.add(a3);
        playerList.add(a4);
        playerList.add(a5);

        CompetitionAmateur c = new CompetitionAmateur(playerList);
        c.competition();
    }
}