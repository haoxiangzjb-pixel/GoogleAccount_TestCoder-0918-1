import org.junit.jupiter.api.Test;
import static org.junit.jupiter.api.Assertions.*;

public class CalculatorTest_6305 {

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
        assertEquals(1, calculator.add(-2, 3));
    }

    @Test
    void testAddZero() {
        Calculator calculator = new Calculator();
        assertEquals(5, calculator.add(5, 0));
        assertEquals(5, calculator.add(0, 5));
    }

    @Test
    void testAddLargeNumbers() {
        Calculator calculator = new Calculator();
        assertEquals(2000000000, calculator.add(1000000000, 1000000000));
    }
}
