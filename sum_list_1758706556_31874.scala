object SumList {
  // Функция для суммирования списка чисел
  def sumList(numbers: List[Int]): Int = {
    numbers.sum
  }

  // Альтернативная реализация с использованием foldLeft
  def sumListFold(numbers: List[Int]): Int = {
    numbers.foldLeft(0)(_ + _)
  }

  def main(args: Array[String]): Unit = {
    val exampleList = List(1, 2, 3, 4, 5)
    println(s"Сумма $exampleList = ${sumList(exampleList)}")
    println(s"Сумма (fold) $exampleList = ${sumListFold(exampleList)}")
  }
}