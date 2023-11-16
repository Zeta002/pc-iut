package td4;

import java.util.ArrayList;

public class CompetitionAmateur {
    private ArrayList<Amateur> playerBase;

    public CompetitionAmateur(ArrayList<Amateur> playerBase) {
        this.playerBase = playerBase;
    }

    public void competition() {
        double bestScore = 0;
        Amateur winner = null;
        for (Amateur participant : playerBase) {
            if (participant.getScore() >= bestScore) {
                bestScore = participant.getScore();
                winner = participant;
            }
        }
        if (winner != null) {
            System.out.println("L'amateur " + winner.getName() + " a gagné : " + winner.toString());
        } else {
            System.out.println("Il n'y à pas de vainqueur.");
        }
    }
}
