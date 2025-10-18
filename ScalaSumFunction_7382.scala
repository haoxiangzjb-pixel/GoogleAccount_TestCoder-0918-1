object NumberSummer {
  // Function to sum a list of numbers
  def sumList(numbers: List[Double]): Double = {
    numbers.sum
  }
  
  // Alternative implementation using fold
  def sumListFold(numbers: List[Double]): Double = {
    numbers.foldLeft(0.0)(_ + _)
  }
  
  // Example usage
  def main(args: Array[String]): Unit = {
    val testList = List(1.0, 2.0, 3.0, 4.0, 5.0)
    println(s"Sum of $testList is: ${sumList(testList)}")
    
    val emptyList = List[Double]()
    println(s"Sum of empty list is: ${sumList(emptyList)}")
    
    val mixedList = List(-1.5, 2.7, 3.3, -0.5)
    println(s"Sum of $mixedList is: ${sumList(mixedList)}")
  }
}