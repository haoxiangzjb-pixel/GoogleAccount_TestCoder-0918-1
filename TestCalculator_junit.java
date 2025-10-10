import static org.junit.jupiter.api.Assertions.assertEquals;
import org.junit.jupiter.api.Test;

public class TestCalculator_junit {

    // Assume the Calculator class exists with an add method
    public static class Calculator {
        public int add(int a, int b) {
            return a + b;
        }
    }

    @Test
    public void testAdd() {
        Calculator calc = new Calculator();
        assertEquals(5, calc.add(2, 3), "2 + 3 should equal 5");
        assertEquals(0, calc.add(-1, 1), "-1 + 1 should equal 0");
        assertEquals(-5, calc.add(-2, -3), "-2 + -3 should equal -5");
    }
}