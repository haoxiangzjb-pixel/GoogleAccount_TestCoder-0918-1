// 定义一个表示坐标点的样例类
case class Point(x: Double, y: Double) {
  override def toString: String = s"Point($x, $y)"
}

object PointApp extends App {
  // 创建一个示例点
  val point = Point(3.5, 7.2)
  
  // 将点的信息写入一个随机命名的文件
  import java.io.PrintWriter
  import scala.util.Random
  
  val randomFileName = s"point_${Random.nextInt(1000000)}.txt"
  val writer = new PrintWriter(randomFileName)
  writer.write(point.toString)
  writer.close()
  
  println(s"Point saved to file: $randomFileName")
  println(s"Point details: $point")
}