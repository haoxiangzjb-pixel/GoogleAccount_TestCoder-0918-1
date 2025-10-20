import org.junit.Test;
import static org.junit.Assert.assertEquals;

public class TestCalculatorAdd_89273 {
    
    @Test
    public void testAddPositiveNumbers() {
        Calculator calculator = new Calculator();
        int result = calculator.add(2, 3);
        assertEquals(5, result);
    }
    
    @Test
    public void testAddNegativeNumbers() {
        Calculator calculator = new Calculator();
        int result = calculator.add(-2, -3);
        assertEquals(-5, result);
    }
    
    @Test
    public void testAddZero() {
        Calculator calculator = new Calculator();
        int result = calculator.add(5, 0);
        assertEquals(5, result);
    }
    
    @Test
    public void testAddWithZeroNegative() {
        Calculator calculator = new Calculator();
        int result = calculator.add(0, -10);
        assertEquals(-10, result);
    }
}