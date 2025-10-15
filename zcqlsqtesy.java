import org.junit.Test;
import static org.junit.Assert.assertEquals;

public class zcqlsqtesy {
    @Test
    public void testAdd() {
        Calculator calculator = new Calculator();
        
        // Test positive numbers
        assertEquals(5, calculator.add(2, 3));
        
        // Test negative numbers
        assertEquals(-1, calculator.add(-2, 1));
        
        // Test zero
        assertEquals(7, calculator.add(7, 0));
        assertEquals(3, calculator.add(0, 3));
        
        // Test both negative
        assertEquals(-8, calculator.add(-3, -5));
    }
}