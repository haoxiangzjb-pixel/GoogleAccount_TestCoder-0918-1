import static org.junit.jupiter.api.Assertions.assertEquals;
import org.junit.jupiter.api.Test;
import com.example.calculator.Calculator;

public class CalculatorAddTest {

    @Test
    public void testAdd_PositiveNumbers() {
        Calculator calc = new Calculator();
        int result = calc.add(2, 3);
        assertEquals(5, result, "2 + 3 should equal 5");
    }

    @Test
    public void testAdd_NegativeNumbers() {
        Calculator calc = new Calculator();
        int result = calc.add(-2, -3);
        assertEquals(-5, result, "-2 + -3 should equal -5");
    }

    @Test
    public void testAdd_Zero() {
        Calculator calc = new Calculator();
        int result = calc.add(0, 5);
        assertEquals(5, result, "0 + 5 should equal 5");
    }

    @Test
    public void testAdd_MixedPositiveNegative() {
        Calculator calc = new Calculator();
        int result = calc.add(10, -3);
        assertEquals(7, result, "10 + -3 should equal 7");
    }
}