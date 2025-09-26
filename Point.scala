case class Point(x: Double, y: Double)

object PointApp extends App {
  val point = Point(3.5, 7.2)
  println(s"Created point: $point")

  // 将样例类的实例信息写入一个随机命名的文件
  import java.io.PrintWriter
  import java.util.UUID

  val fileName = s"point_data_${UUID.randomUUID().toString.substring(0, 8)}.txt"
  val writer = new PrintWriter(fileName)
  writer.write(point.toString)
  writer.close()
  println(s"Point data saved to file: $fileName")
}