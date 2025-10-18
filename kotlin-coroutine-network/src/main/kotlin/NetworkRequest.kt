import kotlinx.coroutines.*
import io.ktor.client.*
import io.ktor.client.engine.cio.*
import io.ktor.client.request.*
import io.ktor.client.statement.*
import java.io.File
import java.util.*

// 创建HTTP客户端
val client = HttpClient(CIO) {
    engine {
        // 配置超时等参数
        requestTimeout = 30000
    }
}

suspend fun performNetworkRequest(): String {
    return try {
        val response: HttpResponse = client.get("https://httpbin.org/get") {
            headers.append("User-Agent", "Kotlin Coroutine Client")
        }
        
        val responseBody = response.bodyAsText()
        println("网络请求成功，响应长度: ${responseBody.length} 字符")
        responseBody
    } catch (e: Exception) {
        println("网络请求失败: ${e.message}")
        "Error: ${e.message}"
    }
}

fun saveToFile(content: String): String {
    // 生成随机文件名
    val randomFileName = "network_response_${UUID.randomUUID()}.kt"
    val file = File(randomFileName)
    
    file.writeText(content)
    println("内容已保存到文件: ${file.absolutePath}")
    
    return file.absolutePath
}

fun main() = runBlocking {
    println("开始发起网络请求...")
    
    // 执行网络请求
    val responseContent = performNetworkRequest()
    
    // 保存到随机命名的.kt文件
    val savedFilePath = saveToFile(responseContent)
    
    println("任务完成，文件保存在: $savedFilePath")
    
    // 关闭HTTP客户端
    client.close()
}