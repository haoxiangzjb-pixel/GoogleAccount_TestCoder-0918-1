import org.junit.jupiter.api.Test;
import static org.junit.jupiter.api.Assertions.assertEquals;

public class CalculatorTest_03130505 {

    @Test
    void testAddPositiveNumbers() {
        Calculator calculator = new Calculator();
        assertEquals(5, calculator.add(2, 3));
    }

    @Test
    void testAddNegativeNumbers() {
        Calculator calculator = new Calculator();
        assertEquals(-5, calculator.add(-2, -3));
    }

    @Test
    void testAddMixedNumbers() {
        Calculator calculator = new Calculator();
        assertEquals(-1, calculator.add(-2, 3));
    }

    @Test
    void testAddWithZero() {
        Calculator calculator = new Calculator();
        assertEquals(3, calculator.add(0, 3));
    }

    @Test
    void testAddLargeNumbers() {
        Calculator calculator = new Calculator();
        assertEquals(2000000000L, calculator.add(1000000000L, 1000000000L));
    }
}
