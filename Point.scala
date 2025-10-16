// Scala样例类表示坐标点
case class Point(x: Double, y: Double) {
  override def toString: String = s"Point($x, $y)"
}

object PointApp extends App {
  // 创建一个坐标点实例
  val point = Point(3.5, 4.2)
  println(s"创建的坐标点: $point")
  
  // 演示使用坐标点
  val origin = Point(0.0, 0.0)
  println(s"原点: $origin")
  
  // 计算两点之间的距离
  def distance(p1: Point, p2: Point): Double = {
    math.sqrt(math.pow(p2.x - p1.x, 2) + math.pow(p2.y - p1.y, 2))
  }
  
  val dist = distance(point, origin)
  println(s"点 $point 到原点的距离: $dist")
}