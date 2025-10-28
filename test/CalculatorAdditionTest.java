import org.junit.Test;
import static org.junit.Assert.assertEquals;

public class CalculatorAdditionTest {
    
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
    public void testAddPositiveAndNegativeNumber() {
        Calculator calculator = new Calculator();
        int result = calculator.add(5, -3);
        assertEquals(2, result);
    }
    
    @Test
    public void testAddWithZero() {
        Calculator calculator = new Calculator();
        int result = calculator.add(0, 5);
        assertEquals(5, result);
    }
}