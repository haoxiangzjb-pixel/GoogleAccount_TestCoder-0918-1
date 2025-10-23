import kotlinx.coroutines.*
import java.io.File
import java.util.*

// 真实的网络请求示例，使用Kotlin协程
suspend fun fetchRealData(): String {
    return withContext(Dispatchers.IO) {
        // 在实际应用中，这里会发起真正的网络请求
        // 例如使用Ktor, OkHttp或其他网络库
        try {
            // 这里是一个示例，实际中会使用类似下面的代码：
            /*
            val client = HttpClient(CIO)
            val response: String = client.get("https://api.example.com/data")
            client.close()
            */
            
            // 模拟网络请求结果
            delay(1000) // 模拟网络延迟
            "{\n  \"message\": \"Hello from real network request\",\n  \"timestamp\": \"${System.currentTimeMillis()}\",\n  \"status\": \"success\",\n  \"data\": [\"item1\", \"item2\", \"item3\"]\n}"
        } catch (e: Exception) {
            "{\n  \"error\": \"${e.message}\",\n  \"status\": \"failed\"\n}"
        }
    }
}

// 生成随机文件名的函数
fun generateRandomFileName(extension: String = "kt"): String {
    val random = Random()
    val chars = "abcdefghijklmnopqrstuvwxyz0123456789"
    val fileName = StringBuilder()
    
    for (i in 0 until 8) {
        fileName.append(chars[random.nextInt(chars.length)])
    }
    
    return "${fileName}.$extension"
}

// 保存数据到随机命名的.kt文件
suspend fun saveDataToRandomFile(data: String) {
    val randomFileName = generateRandomFileName("kt")
    val file = File(randomFileName)
    
    withContext(Dispatchers.IO) {
        file.writeText("""
            /*
             * Randomly generated file with network response
             * Generated at: ${Date()}
             */
            
            object NetworkResponse {
                const val RESPONSE_DATA = "${data.replace("\n", "\\n").replace("\"", "\\\"")}"
            }
        """.trimIndent())
    }
    
    println("Data saved to: $randomFileName")
}

// 主函数，展示完整的协程网络请求流程
fun main() = runBlocking {
    println("开始协程网络请求...")
    
    // 启动一个协程来获取数据
    val deferredData = async { 
        fetchRealData()
    }
    
    // 可以在等待网络请求的同时执行其他任务
    println("网络请求进行中...可以执行其他任务")
    delay(500) // 模拟其他任务
    
    // 获取网络请求结果
    val data = deferredData.await()
    println("收到响应: $data")
    
    // 保存到随机命名的.kt文件
    println("\n保存到随机命名的.kt文件...")
    saveDataToRandomFile(data)
    
    // 演示并发请求
    println("\n发起多个并发网络请求...")
    val requests = (1..3).map { index ->
        async {
            delay((1000L * index / 2)) // 模拟不同请求的响应时间
            "{\n  \"request_id\": $index,\n  \"data\": \"Response from request $index\",\n  \"timestamp\": \"${System.currentTimeMillis()}\"\n}"
        }
    }
    
    val results = awaitAll(*requests.toTypedArray())
    results.forEachIndexed { index, result ->
        println("请求 ${index + 1} 结果: $result")
        
        // 将每个结果保存到单独的随机命名文件
        runBlocking {
            saveDataToRandomFile(result)
        }
    }
    
    println("\n所有任务完成!")
}