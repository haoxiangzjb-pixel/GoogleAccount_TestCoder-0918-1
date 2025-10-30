def sumList(numbers: List[Int]): Int = {
  numbers.sum
}

// Test the function
val testList = List(1, 2, 3, 4, 5)
println(s"Sum of $testList is: ${sumList(testList)}")

val emptyList = List[Int]()
println(s"Sum of empty list is: ${sumList(emptyList)}")

val negativeList = List(-1, -2, 3, 4)
println(s"Sum of $negativeList is: ${sumList(negativeList)}")