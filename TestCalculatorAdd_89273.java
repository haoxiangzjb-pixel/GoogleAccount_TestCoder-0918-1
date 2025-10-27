import org.junit.Test;
import static org.junit.Assert.assertEquals;

public class TestCalculatorAdd_89273 {
    
    @Test
    public void testAddPositiveNumbers() {
        Calculator calculator = new Calculator();
        int result = calculator.add(5, 3);
        assertEquals(8, result);
    }
    
    @Test
    public void testAddNegativeNumbers() {
        Calculator calculator = new Calculator();
        int result = calculator.add(-5, -3);
        assertEquals(-8, result);
    }
    
    @Test
    public void testAddPositiveAndNegativeNumber() {
        Calculator calculator = new Calculator();
        int result = calculator.add(10, -3);
        assertEquals(7, result);
    }
    
    @Test
    public void testAddWithZero() {
        Calculator calculator = new Calculator();
        int result = calculator.add(0, 5);
        assertEquals(5, result);
    }
    
    @Test
    public void testAddBothZeros() {
        Calculator calculator = new Calculator();
        int result = calculator.add(0, 0);
        assertEquals(0, result);
    }
}