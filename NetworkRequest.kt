import kotlinx.coroutines.*
import java.io.File
import java.util.*

fun main() = runBlocking {
    // 模拟网络请求，获取一些数据
    val networkData = async(Dispatchers.IO) {
        delay(1000) // 模拟网络延迟
        "这是从网络请求获取的数据！"
    }

    // 等待网络请求完成
    val data = networkData.await()

    // 生成随机文件名
    val randomFileName = "NetworkResult_${UUID.randomUUID()}.kt"

    // 将数据写入随机命名的.kt文件
    File(randomFileName).writeText(data)

    println("网络请求结果已保存到文件: $randomFileName")
}