object NumberSummer {
  // Function to sum a list of numbers
  def sumNumbers(numbers: List[Double]): Double = {
    numbers.sum
  }

  // Alternative implementation using fold
  def sumNumbersFold(numbers: List[Double]): Double = {
    numbers.foldLeft(0.0)(_ + _)
  }

  // Example usage
  def main(args: Array[String]): Unit = {
    val numberList = List(1.0, 2.0, 3.0, 4.0, 5.0)
    val result = sumNumbers(numberList)
    println(s"Sum of $numberList is: $result")
    
    val result2 = sumNumbersFold(numberList)
    println(s"Sum using fold of $numberList is: $result2")
  }
}