import scala.util.Random

// 定义一个样例类表示坐标点
case class Point(x: Double, y: Double)

object PointApp extends App {
  // 创建一个 Point 实例
  val myPoint = Point(3.5, 7.2)
  println(s"Created point: $myPoint")

  // 生成随机文件名
  val randomFileName = s"PointClass_${Random.nextLong().abs}.scala"

  // 将样例类定义写入随机命名的文件
  import java.io.{File, PrintWriter}
  val writer = new PrintWriter(new File(randomFileName))
  try {
    writer.write(
      """|// 定义一个样例类表示坐标点
         |case class Point(x: Double, y: Double)
         |
         |// 示例用法
         |val examplePoint = Point(1.0, 2.0)
         |println(s"Example point: $$examplePoint")
         |""".stripMargin
    )
    println(s"Case class definition saved to $$randomFileName")
  } finally {
    writer.close()
  }
}