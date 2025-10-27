// Scala function to sum a list of numbers
def sumNumbers(numbers: List[Int]): Int = {
  numbers.sum
}

// Example usage
val exampleList = List(1, 2, 3, 4, 5)
println(s"Sum of $exampleList is ${sumNumbers(exampleList)}")