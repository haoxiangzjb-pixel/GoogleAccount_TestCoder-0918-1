// 定义一个表示坐标点的样例类
case class Point(x: Double, y: Double) {
  override def toString: String = s"Point($x, $y)"
}

// 创建一个坐标点实例
val point = Point(5.7, 8.9)

// 生成另一个随机文件名来保存坐标点信息
val randomFileName = "point_data_" + System.currentTimeMillis() + ".txt"

// 将坐标点信息保存到随机命名的文件中
import java.io.PrintWriter
val writer = new PrintWriter(randomFileName)
writer.write(point.toString)
writer.close()

println(s"坐标点 $point 已保存到文件: $randomFileName")
