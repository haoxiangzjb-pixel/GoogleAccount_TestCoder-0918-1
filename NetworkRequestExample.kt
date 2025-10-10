import kotlinx.coroutines.*
import java.io.File
import java.util.*

fun main() = runBlocking {
    // Simulate a network request using delay
    println("发起网络请求...")
    delay(1000) // 模拟1秒的网络延迟
    val data = "模拟的网络数据: {\"status\": \"success\", \"data\": \"Hello, Kotlin Coroutines!\"}"

    // 生成随机文件名
    val randomFileName = "request_result_" + UUID.randomUUID().toString().substring(0, 8) + ".json"

    // 将数据写入随机命名的文件
    File(randomFileName).writeText(data)
    println("数据已保存到文件: $randomFileName")
}