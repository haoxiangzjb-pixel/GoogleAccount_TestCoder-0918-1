case class Point(x: Double, y: Double) {
  override def toString: String = s"Point($x, $y)"
}

object PointDemo extends App {
  val p1 = Point(3.5, 7.2)
  val p2 = Point(0.0, 0.0)
  
  println(s"Origin: $p2")
  println(s"Sample point: $p1")
}
