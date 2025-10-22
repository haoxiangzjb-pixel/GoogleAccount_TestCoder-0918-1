import kotlinx.coroutines.*
import java.io.File
import java.util.*

// 模拟网络请求的函数
suspend fun makeNetworkRequest(): String {
    return withContext(Dispatchers.IO) {
        // 模拟网络延迟
        delay(1000)
        // 模拟网络响应
        val responses = listOf(
            "HTTP GET request successful",
            "Data fetched from API",
            "Server response: {\"status\": \"ok\", \"data\": [1, 2, 3]}",
            "API call completed with 200 OK",
            "Successfully retrieved information"
        )
        responses[Random().nextInt(responses.size)]
    }
}

// 生成随机文件名的函数
fun generateRandomFileName(): String {
    val random = Random()
    val sb = StringBuilder()
    for (i in 0 until 8) {
        sb.append(('a'..'z').random())
    }
    return "network_response_${sb}.kt"
}

// 保存内容到随机命名的.kt文件的函数
fun saveToFile(content: String) {
    val fileName = generateRandomFileName()
    val file = File(fileName)
    file.writeText(content)
    println("Content saved to: $fileName")
}

fun main() = runBlocking {
    println("Starting network request...")
    
    // 发起网络请求
    val response = makeNetworkRequest()
    
    println("Received response: $response")
    
    // 准备要保存的内容
    val contentToSave = """// Network Request Result
// Generated at: ${Date()}

val networkResponse = \"$response\"

fun getNetworkResponse(): String {
    return networkResponse
}

fun main() {
    println(\"Network response: \$networkResponse\")
}
"""
    
    // 保存到随机命名的.kt文件
    saveToFile(contentToSave)
    
    println("Process completed!")
}