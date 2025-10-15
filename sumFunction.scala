object NumberSummer {
  def sumNumbers(numbers: List[Int]): Int = {
    numbers.sum
  }

  def sumNumbersRecursive(numbers: List[Int]): Int = {
    numbers match {
      case Nil => 0
      case head :: tail => head + sumNumbersRecursive(tail)
    }
  }

  def main(args: Array[String]): Unit = {
    val testList = List(1, 2, 3, 4, 5)
    println(s"Sum of $testList is: ${sumNumbers(testList)}")
    println(s"Recursive sum of $testList is: ${sumNumbersRecursive(testList)}")
  }
}