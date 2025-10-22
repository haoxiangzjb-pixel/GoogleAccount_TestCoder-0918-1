object SumList {
  // Функция для суммирования списка чисел
  def sumList(numbers: List[Int]): Int = {
    numbers.sum
  }

  // Альтернативная реализация с использованием fold
  def sumListFold(numbers: List[Int]): Int = {
    numbers.foldLeft(0)(_ + _)
  }

  // Пример использования
  def main(args: Array[String]): Unit = {
    val numbers = List(1, 2, 3, 4, 5)
    println(s"Сумма списка $numbers: ${sumList(numbers)}")
    println(s"Сумма списка $numbers (fold): ${sumListFold(numbers)}")
  }
}