// 定义一个表示坐标点的 Scala 样例类
case class Point(x: Double, y: Double)

object PointExample extends App {
  // 创建一个 Point 实例
  val myPoint = Point(3.5, 7.2)

  // 打印该实例
  println(s"创建的点是: $myPoint")
}