package td;

import static org.junit.jupiter.api.Assertions.*;

class HomeTest {

    @org.junit.jupiter.api.Test
    void isTaxCorrect() {
        Home h1 = new Home("theName", "theAddress", 10);
        assertEquals(1, h1.tax(10));
        Home h2 = new Home("theName", "theAddress", 100);
        assertEquals(10, h2.tax(10));
    }

    @org.junit.jupiter.api.Test
    void isTheToStringWorking() {
        Home h = new Home("theName", "theAddress", 10);
        assertEquals("Home[owner=theName, address=theAddress, surface=10]", h.toString());
    }
}