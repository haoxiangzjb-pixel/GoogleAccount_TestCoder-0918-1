object SumFunction {
  def sumList(numbers: List[Int]): Int = {
    numbers.sum
  }

  // Alternative implementation using fold
  def sumListFold(numbers: List[Int]): Int = {
    numbers.foldLeft(0)(_ + _)
  }

  // Generic version that works with any numeric type
  def sumListGeneric[T](numbers: List[T])(implicit numeric: Numeric[T]): T = {
    numbers.foldLeft(numeric.zero)(numeric.plus)
  }

  def main(args: Array[String]): Unit = {
    val testList = List(1, 2, 3, 4, 5)
    println(s"Sum of $testList is: ${sumList(testList)}")
    
    val emptyList = List[Int]()
    println(s"Sum of empty list is: ${sumList(emptyList)}")
    
    val negativeList = List(-1, -2, 3, 4)
    println(s"Sum of $negativeList is: ${sumList(negativeList)}")
  }
}