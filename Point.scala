case class Point(x: Double, y: Double)

object PointApp extends App {
  val p1 = Point(1.0, 2.0)
  println(s"Created point: $p1")

  // 将样例类实例写入一个随机命名的文件
  val fileName = s"point_data_${scala.util.Random.nextInt(10000)}.txt"
  import java.io._
  val writer = new PrintWriter(new File(fileName))
  writer.write(p1.toString)
  writer.close()
  println(s"Point data saved to file: $fileName")
}