object NumberSummer {
  def sumNumbers(numbers: List[Int]): Int = {
    numbers.sum
  }

  // Example usage
  def main(args: Array[String]): Unit = {
    val numbers = List(1, 2, 3, 4, 5)
    val result = sumNumbers(numbers)
    println(s"Sum of $numbers is $result")
  }
}