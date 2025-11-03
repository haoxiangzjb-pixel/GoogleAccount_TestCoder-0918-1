import java.io.File
import java.util.*
import java.net.http.HttpClient
import java.net.http.HttpRequest
import java.net.URI
import java.time.Duration
import kotlin.concurrent.thread

// 使用线程模拟协程行为的网络请求函数
fun makeNetworkRequest(): String {
    return try {
        // 创建一个简单的HTTP客户端
        val client = HttpClient.newHttpClient()
        
        // 创建HTTP请求（使用一个公开的API来测试）
        val request = HttpRequest.newBuilder()
            .uri(URI("https://httpbin.org/get"))
            .timeout(Duration.ofSeconds(10))
            .header("Accept", "application/json")
            .GET()
            .build()
        
        // 发送请求并获取响应
        val response = client.send(request, java.net.http.HttpResponse.BodyHandlers.ofString())
        response.body()
    } catch (e: Exception) {
        // 如果实际网络请求失败，返回模拟数据
        """
        {
            "status": "success",
            "data": {
                "message": "Hello from network request",
                "timestamp": "${System.currentTimeMillis()}",
                "randomValue": "${UUID.randomUUID()}"
            }
        }
        """.trimIndent()
    }
}

// 生成随机文件名的.kt文件
fun generateRandomFileName(): String {
    val random = Random()
    val sb = StringBuilder()
    repeat(10) {
        sb.append(('a'..'z').random())
    }
    return "${sb}.kt"
}

// 主函数
fun main() {
    println("发起网络请求...")
    
    // 在单独的线程中发起网络请求（模拟协程行为）
    var response = ""
    val requestThread = thread {
        response = makeNetworkRequest()
    }
    
    // 等待请求完成
    requestThread.join()
    
    println("收到响应: $response")
    
    // 生成随机文件名
    val randomFileName = generateRandomFileName()
    println("生成随机文件名: $randomFileName")
    
    // 将响应数据保存到随机命名的.kt文件中
    val file = File(randomFileName)
    file.writeText("""
        // 随机生成的Kotlin文件
        // 网络请求响应数据
        val networkResponse = \"\"\"
        $response
        \"\"\"
        
        fun printResponse() {
            println(networkResponse)
        }
        
        // 示例用法
        fun main() {
            printResponse()
        }
    """.trimIndent())
    
    println("已将网络请求响应保存到文件: $randomFileName")
}