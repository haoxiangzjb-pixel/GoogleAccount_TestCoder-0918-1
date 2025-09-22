case class Point(x: Double, y: Double)

object Point {
  def main(args: Array[String]): Unit = {
    val p1 = Point(1.0, 2.0)
    val p2 = Point(3.5, 4.5)
    println(s"Point 1: $p1")
    println(s"Point 2: $p2")
  }
}