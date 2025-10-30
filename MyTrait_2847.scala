// Scala trait with both abstract and concrete methods
trait MyTrait {
  // Abstract methods (no implementation)
  def abstractMethod1: String
  def abstractMethod2(x: Int): Int
  
  // Concrete method (with implementation)
  def concreteMethod: String = {
    "This is a concrete method with implementation"
  }
  
  // Another concrete method using abstract methods
  def combinedMethod: String = {
    s"Result: ${abstractMethod1} and ${abstractMethod2(10)}"
  }
}

// Example implementation of the trait
class MyClass extends MyTrait {
  def abstractMethod1: String = "Implemented abstract method 1"
  
  def abstractMethod2(x: Int): Int = x * 2
}