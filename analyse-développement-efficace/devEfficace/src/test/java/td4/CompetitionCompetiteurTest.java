package td4;

import java.util.ArrayList;

class CompetitionCompetiteurTest {

    @org.junit.jupiter.api.Test
    void competition() {
        Competiteur a1 = new Competiteur("Quentin", 19);
        Competiteur a2 = new Competiteur("Angelo", 18);
        Competiteur a3 = new Competiteur("Clément", 19);
        Competiteur a4 = new Competiteur("Aurore", 19);
        Competiteur a5 = new Competiteur("Valentin", 19);
        ArrayList<Competiteur> playerList = new ArrayList<Competiteur>();
        playerList.add(a1);
        playerList.add(a2);
        playerList.add(a3);
        playerList.add(a4);
        playerList.add(a5);

        CompetitionCompetiteur c = new CompetitionCompetiteur(playerList);
        c.competition();
    }
}