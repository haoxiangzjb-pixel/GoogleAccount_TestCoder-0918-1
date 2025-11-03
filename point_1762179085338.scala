// 定义表示坐标点的样例类
case class Point(x: Double, y: Double) {
  override def toString: String = s"Point($x, $y)"
}

// 创建的坐标点实例
val point = Point(3.5, 4.2)

println(s"创建的坐标点: $point")
