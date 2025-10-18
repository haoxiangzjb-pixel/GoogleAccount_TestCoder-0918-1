import kotlinx.coroutines.*
import java.io.File
import java.net.URI
import java.net.http.HttpClient
import java.net.http.HttpRequest
import java.net.http.HttpResponse
import java.time.Duration
import java.util.*

fun main() = runBlocking {
    println("开始发起网络请求...")
    
    // 执行网络请求
    val responseContent = performNetworkRequest()
    
    // 保存到随机命名的.kt文件
    val savedFilePath = saveToFile(responseContent)
    
    println("任务完成，文件保存在: $savedFilePath")
}

suspend fun performNetworkRequest(): String = withContext(Dispatchers.IO) {
    try {
        val client = HttpClient.newBuilder()
            .connectTimeout(Duration.ofSeconds(10))
            .build()
        
        val request = HttpRequest.newBuilder()
            .uri(URI.create("https://httpbin.org/get"))
            .timeout(Duration.ofSeconds(30))
            .header("User-Agent", "Kotlin Coroutine Client")
            .GET()
            .build()
        
        val response = client.send(request, HttpResponse.BodyHandlers.ofString())
        val responseBody = response.body()
        
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