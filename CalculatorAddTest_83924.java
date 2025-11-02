import static org.junit.jupiter.api.Assertions.assertEquals;
import org.junit.jupiter.api.Test;

public class CalculatorAddTest_83924 {
    
    // Calculator class with add method
    public static class Calculator {
        public int add(int a, int b) {
            return a + b;
        }
    }
    
    @Test
    public void testAddPositiveNumbers() {
        Calculator calculator = new Calculator();
        int result = calculator.add(5, 3);
        assertEquals(8, result, "5 + 3 should equal 8");
    }
    
    @Test
    public void testAddNegativeNumbers() {
        Calculator calculator = new Calculator();
        int result = calculator.add(-5, -3);
        assertEquals(-8, result, "-5 + (-3) should equal -8");
    }
    
    @Test
    public void testAddZero() {
        Calculator calculator = new Calculator();
        int result = calculator.add(5, 0);
        assertEquals(5, result, "5 + 0 should equal 5");
    }
    
    @Test
    public void testAddWithNegative() {
        Calculator calculator = new Calculator();
        int result = calculator.add(10, -5);
        assertEquals(5, result, "10 + (-5) should equal 5");
    }
}