import org.junit.Test;
import static org.junit.Assert.assertEquals;

public class CalculatorAddTest {

    @Test
    public void testAdd_PositiveNumbers() {
        Calculator calc = new Calculator();
        int result = calc.add(2, 3);
        assertEquals(5, result);
    }

    @Test
    public void testAdd_NegativeNumbers() {
        Calculator calc = new Calculator();
        int result = calc.add(-2, -3);
        assertEquals(-5, result);
    }

    @Test
    public void testAdd_Zero() {
        Calculator calc = new Calculator();
        int result = calc.add(0, 5);
        assertEquals(5, result);
    }
}