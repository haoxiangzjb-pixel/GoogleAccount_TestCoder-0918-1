object SumListFunction {
  /**
   * Function to sum a list of numbers
   * @param numbers List of numbers to sum
   * @return Sum of all numbers in the list
   */
  def sumList(numbers: List[Int]): Int = {
    numbers.sum
  }

  // Alternative implementation using fold
  def sumListFold(numbers: List[Int]): Int = {
    numbers.foldLeft(0)(_ + _)
  }

  // Example usage
  def main(args: Array[String]): Unit = {
    val exampleList = List(1, 2, 3, 4, 5)
    println(s"Sum of $exampleList is: ${sumList(exampleList)}")
    
    val emptyList = List()
    println(s"Sum of empty list is: ${sumList(emptyList)}")
    
    val negativeList = List(-1, -2, 3, 4)
    println(s"Sum of $negativeList is: ${sumList(negativeList)}")
  }
}