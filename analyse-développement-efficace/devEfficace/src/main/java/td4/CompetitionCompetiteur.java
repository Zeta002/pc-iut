package td4;

import java.util.ArrayList;

public class CompetitionCompetiteur {
    private ArrayList<Competiteur> playerBase;

    public CompetitionCompetiteur(ArrayList<Competiteur> playerBase) {
        this.playerBase = playerBase;
    }

    public void competition() {
        double bestScore = 0;
        Competiteur winner = null;
        for (Competiteur participant : playerBase) {
            if (participant.getScore() >= bestScore) {
                bestScore = participant.getScore();
                winner = participant;
            }
        }
        if (winner != null) {
            System.out.println("Le competiteur " + winner.getName() + " a gagné : " + winner.toString());
        } else {
            System.out.println("Il n'y à pas de vainqueur.");
        }
    }
}
