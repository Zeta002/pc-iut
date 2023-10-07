package td;

import org.junit.jupiter.api.Test;

import static org.junit.jupiter.api.Assertions.*;

class PersonalHomeTest {

    @Test
    void isTaxCorrect() {
        PersonalHome p1 = new PersonalHome("theOwner", "theAddress", 100, 1, 80, true);
        assertEquals(103, p1.tax(10));
        PersonalHome p2 = new PersonalHome("theOwner", "theAddress", 100, 1, 80, false);
        assertEquals(23, p2.tax(10));
        PersonalHome p3 = new PersonalHome("theOwner", "theAddress", 100, 2, 80, false);
        assertEquals(38, p3.tax(10));
    }
}