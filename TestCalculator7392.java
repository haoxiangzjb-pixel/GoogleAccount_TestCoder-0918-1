public class TestCalculator7392 {
    
    public static void main(String[] args) {
        TestCalculator7392 test = new TestCalculator7392();
        test.testAdd();
        System.out.println("All tests passed!");
    }
    
    public void testAdd() {
        Calculator calculator = new Calculator();
        
        // Test positive numbers
        assertEqual(5, calculator.add(2, 3), "2 + 3 should equal 5");
        
        // Test negative numbers
        assertEqual(-1, calculator.add(-4, 3), "-4 + 3 should equal -1");
        
        // Test with zero
        assertEqual(7, calculator.add(7, 0), "7 + 0 should equal 7");
        assertEqual(-3, calculator.add(0, -3), "0 + (-3) should equal -3");
        
        // Test two zeros
        assertEqual(0, calculator.add(0, 0), "0 + 0 should equal 0");
    }
    
    private void assertEqual(int expected, int actual, String message) {
        if (expected != actual) {
            throw new AssertionError(message + " (expected: " + expected + ", actual: " + actual + ")");
        }
    }
}