public class TestRunner {
    public static void main(String[] args) {
        Calculator calculator = new Calculator();
        
        // Manual test of the add method
        System.out.println("Testing Calculator.add method:");
        
        // Test positive numbers
        assert calculator.add(2, 3) == 5 : "Test failed: add(2, 3) should be 5";
        System.out.println("✓ add(2, 3) = " + calculator.add(2, 3));
        
        // Test negative numbers
        assert calculator.add(-4, 3) == -1 : "Test failed: add(-4, 3) should be -1";
        System.out.println("✓ add(-4, 3) = " + calculator.add(-4, 3));
        
        // Test zero
        assert calculator.add(7, 0) == 7 : "Test failed: add(7, 0) should be 7";
        System.out.println("✓ add(7, 0) = " + calculator.add(7, 0));
        
        assert calculator.add(0, 3) == 3 : "Test failed: add(0, 3) should be 3";
        System.out.println("✓ add(0, 3) = " + calculator.add(0, 3));
        
        // Test both zeros
        assert calculator.add(0, 0) == 0 : "Test failed: add(0, 0) should be 0";
        System.out.println("✓ add(0, 0) = " + calculator.add(0, 0));
        
        // Test large numbers
        assert calculator.add(500000, 500000) == 1000000 : "Test failed: add(500000, 500000) should be 1000000";
        System.out.println("✓ add(500000, 500000) = " + calculator.add(500000, 500000));
        
        System.out.println("\nAll tests passed!");
    }
}