object SumList {
  def sumList(numbers: List[Int]): Int = {
    numbers.sum
  }

  def main(args: Array[String]): Unit = {
    val testList = List(1, 2, 3, 4, 5)
    println(s"Сумма списка $testList равна ${sumList(testList)}")
  }
}