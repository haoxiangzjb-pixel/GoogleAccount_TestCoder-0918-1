object PatternMatchingExample {
  def matchExample(input: Any): String = {
    input match {
      case 0 => "Zero"
      case x: Int if x > 0 => s"Positive integer: $x"
      case x: Int if x < 0 => s"Negative integer: $x"
      case s: String if s.isEmpty => "Empty string"
      case s: String => s"String: $s"
      case list: List[_] => s"List with ${list.length} elements"
      case _ => "Unknown type"
    }
  }

  def main(args: Array[String]): Unit = {
    println(matchExample(0))
    println(matchExample(42))
    println(matchExample(-5))
    println(matchExample(""))
    println(matchExample("Hello"))
    println(matchExample(List(1, 2, 3)))
    println(matchExample(3.14))
  }
}