// 定义一个表示坐标点的样例类
case class Point(x: Double, y: Double) {
  override def toString: String = s"Point($x, $y)"
}

// 创建一个坐标点实例
val point = Point(3.5, 4.2)

// 生成随机文件名（使用时间戳确保唯一性）
val randomFileName = s"point_${System.currentTimeMillis()}.txt"

// 将坐标点信息保存到随机命名的文件中
import java.io.PrintWriter
val writer = new PrintWriter(randomFileName)
writer.write(point.toString)
writer.close()

println(s"坐标点 $point 已保存到文件: $randomFileName")

// 验证文件内容
val source = scala.io.Source.fromFile(randomFileName)
val content = source.getLines().mkString
source.close()
println(s"文件内容: $content")