import kotlinx.coroutines.*
import java.io.File
import java.util.*

/**
 * 使用Kotlin协程发起网络请求并保存到随机命名的.kt文件的示例
 * 
 * 这个示例展示了:
 * 1. 如何使用Kotlin协程发起网络请求
 * 2. 如何将请求结果保存到随机命名的.kt文件中
 */

// 模拟网络请求函数
suspend fun performNetworkRequest(url: String): String {
    println("发起网络请求到: $url")
    
    // 模拟网络延迟
    delay(800)
    
    // 模拟网络响应
    return """
        {
            "status": "success",
            "data": {
                "url": "$url",
                "timestamp": "${Date()}",
                "message": "这是来自API的响应数据",
                "coroutine_info": "This response was fetched using Kotlin Coroutines"
            },
            "headers": {
                "content-type": "application/json",
                "server": "API Server"
            }
        }
    """.trimIndent()
}

// 将网络请求结果保存到随机命名的.kt文件
fun saveResultToFile(content: String): String {
    // 生成随机文件名
    val randomFileName = "network_response_${UUID.randomUUID()}.kt"
    val file = File(randomFileName)
    
    // 创建文件内容
    val fileContent = """
        /**
         * 网络请求响应数据
         * 生成时间: ${Date()}
         * 源URL: $url
         */
        
        val networkResponse = $content
        
        // 附加信息
        val responseInfo = mapOf(
            "fileName" to "$randomFileName",
            "generatedAt" to "${Date()}",
            "type" to "Network Response Data"
        )
    """.trimIndent()
    
    // 写入文件
    file.writeText(fileContent)
    
    return randomFileName
}

fun main() = runBlocking {
    println("开始执行Kotlin协程网络请求示例...")
    
    // 定义要请求的URL
    val url = "https://jsonplaceholder.typicode.com/posts/1"
    
    try {
        // 使用协程发起网络请求
        val response = withTimeout(5000) { // 5秒超时
            performNetworkRequest(url)
        }
        
        println("网络请求成功完成!")
        println("响应内容:\n$response")
        
        // 将响应保存到随机命名的.kt文件
        val fileName = saveResultToFile(response)
        
        println("\n响应已保存到随机命名的.kt文件: $fileName")
        println("文件大小: ${File(fileName).length()} 字节")
        println("文件存在: ${File(fileName).exists()}")
        
        // 列出当前目录中所有以network_response_开头的.kt文件
        val networkFiles = File(".").listFiles { file -> 
            file.name.startsWith("network_response_") && file.name.endsWith(".kt") 
        }
        
        println("\n当前目录中找到 ${networkFiles?.size ?: 0} 个网络响应文件:")
        networkFiles?.forEach { file ->
            println("- ${file.name} (${file.length()} 字节)")
        }
        
    } catch (e: TimeoutCancellationException) {
        println("网络请求超时: ${e.message}")
    } catch (e: Exception) {
        println("发生错误: ${e.message}")
        e.printStackTrace()
    }
    
    println("\n示例执行完成!")
}