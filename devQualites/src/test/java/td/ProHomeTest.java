package td;

import org.junit.jupiter.api.Test;

import static org.junit.jupiter.api.Assertions.*;

class ProHomeTest {

    @Test
    void isTaxCorrect() {
        ProHome p1 = new ProHome("theOwner", "theAddress", 10, 10);
        assertEquals(151, p1.tax(10));
        ProHome p2 = new ProHome("theOwner", "theAddress", 10, 14);
        assertEquals(151, p2.tax(10));
        ProHome p3 = new ProHome("theOwner", "theAddress", 10, 20);
        assertEquals(301, p3.tax(10));
    }
}