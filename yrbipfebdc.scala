// Scala function to sum a list of numbers
def sumList(numbers: List[Double]): Double = {
  numbers.sum
}

// Alternative implementation using fold
def sumListFold(numbers: List[Double]): Double = {
  numbers.fold(0.0)(_ + _)
}

// Example usage:
// val numbers = List(1.0, 2.0, 3.0, 4.0, 5.0)
// println(sumList(numbers)) // Output: 15.0
// println(sumListFold(numbers)) // Output: 15.0