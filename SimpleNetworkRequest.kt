import java.io.File
import java.util.*

// 模拟一个简单的“网络请求”函数，返回一个值
fun simulateNetworkRequest(): String {
    println("模拟发起网络请求...")
    Thread.sleep(1000) // 模拟1秒的网络延迟
    println("网络请求完成！")
    return "这是从网络请求获取的数据！"
}

fun main() {
    // 启动一个新线程来模拟异步操作
    val thread = Thread {
        val data = simulateNetworkRequest()

        // 生成随机文件名
        val randomFileName = "NetworkResult_${UUID.randomUUID()}.kt"

        // 将数据写入随机命名的.kt文件
        File(randomFileName).writeText(data)

        println("网络请求结果已保存到文件: $randomFileName")
    }

    // 启动线程
    thread.start()

    // 主线程可以继续做其他事情
    println("主线程继续执行其他任务...")

    // 等待异步线程完成，以确保输出完整
    thread.join()

    println("所有任务完成。")
}