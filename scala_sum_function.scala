object SumList {
  // Функция для суммирования списка чисел
  def sumList(numbers: List[Int]): Int = {
    numbers match {
      case Nil => 0 // Базовый случай: пустой список возвращает 0
      case head :: tail => head + sumList(tail) // Рекурсивный случай: голова плюс сумма хвоста
    }
  }

  // Пример использования (опционально, для демонстрации)
  def main(args: Array[String]): Unit = {
    val exampleList = List(1, 2, 3, 4, 5)
    println(s"Сумма списка $exampleList равна ${sumList(exampleList)}")
  }
}