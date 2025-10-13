import org.junit.Test;
import static org.junit.Assert.assertEquals;

public class CalculatorAddTest {

    @Test
    public void testAdd_PositiveNumbers() {
        Calculator calc = new Calculator();
        int result = calc.add(2, 3);
        assertEquals("2 + 3 should equal 5", 5, result);
    }

    @Test
    public void testAdd_NegativeNumbers() {
        Calculator calc = new Calculator();
        int result = calc.add(-2, -3);
        assertEquals("(-2) + (-3) should equal -5", -5, result);
    }

    @Test
    public void testAdd_Zero() {
        Calculator calc = new Calculator();
        int result = calc.add(5, 0);
        assertEquals("5 + 0 should equal 5", 5, result);
    }
}