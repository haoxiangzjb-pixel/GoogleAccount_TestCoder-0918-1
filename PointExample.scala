object PointExample {
  def main(args: Array[String]): Unit = {
    val point = Point(3.0, 4.0)
    println(point)
  }
}

case class Point(x: Double, y: Double)