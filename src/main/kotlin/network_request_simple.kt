import kotlinx.coroutines.*
import java.io.File
import java.net.http.HttpClient
import java.net.http.HttpRequest
import java.net.URI
import java.util.*

// 网络请求函数，使用协程发起请求并保存到随机命名的.kt文件
suspend fun performNetworkRequestAndSave() {
    try {
        // 使用Java内置的HttpClient发起网络请求
        val client = HttpClient.newHttpClient()
        val request = HttpRequest.newBuilder()
            .uri(URI("https://httpbin.org/get"))
            .header("User-Agent", "Kotlin App")
            .build()
        
        // 使用协程异步执行网络请求
        val response = withTimeout(10000) { // 设置10秒超时
            // 在Dispatchers.IO中执行网络请求
            withContext(Dispatchers.IO) {
                client.send(request, java.net.http.HttpResponse.BodyHandlers.ofString())
            }
        }
        
        val responseText = response.body()
        
        // 生成随机文件名
        val randomFileName = generateRandomFileName()
        val fileName = "${randomFileName}.kt"
        
        // 创建文件内容
        val fileContent = """
            // Generated file: $fileName
            // Created at: ${Date()}
            
            fun main() {
                println("Response from network request:")
                println("$responseText")
            }
        """.trimIndent()
        
        // 保存到文件
        File(fileName).writeText(fileContent)
        
        println("Network request completed and saved to: $fileName")
        
    } catch (e: Exception) {
        println("Error during network request: ${e.message}")
    }
}

// 生成随机文件名的辅助函数
fun generateRandomFileName(): String {
    val chars = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789"
    return (1..10).map { chars.random() }.joinToString("")
}

fun main() = runBlocking {
    println("Starting network request with Kotlin coroutines...")
    performNetworkRequestAndSave()
    println("Process completed!")
}