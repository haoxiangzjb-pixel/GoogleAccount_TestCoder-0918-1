import kotlinx.coroutines.*
import io.ktor.client.*
import io.ktor.client.request.*
import io.ktor.client.statement.*
import java.io.File
import java.util.*

// 网络请求函数，使用协程发起请求并保存到随机命名的.kt文件
suspend fun performNetworkRequestAndSave() {
    val client = HttpClient()
    
    try {
        // 使用Ktor客户端发起真实的网络请求
        val response: HttpResponse = withTimeout(10000) { // 设置10秒超时
            client.get("https://httpbin.org/get") {
                headers.append("User-Agent", "Kotlin App")
            }
        }
        
        val responseText = response.bodyAsText()
        
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
    } finally {
        client.close()
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