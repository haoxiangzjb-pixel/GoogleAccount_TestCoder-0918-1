import kotlinx.coroutines.*
import java.io.File
import java.util.*

// 模拟网络请求的函数
suspend fun fetchData(): String {
    return withContext(Dispatchers.IO) {
        // 模拟网络延迟
        delay(1000)
        // 返回模拟的网络响应
        "{\n  \"message\": \"Hello from network request\",\n  \"timestamp\": \"${System.currentTimeMillis()}\",\n  \"status\": \"success\"\n}"
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
                const val RESPONSE_DATA = ${data.replace("\n", "\\n").replace("\"", "\\\"")}
            }
        """.trimIndent())
    }
    
    println("Data saved to: $randomFileName")
}

fun main() = runBlocking {
    println("发起网络请求...")
    val data = fetchData()
    println("收到响应: $data")
    
    println("\n保存到随机命名的.kt文件...")
    saveDataToRandomFile(data)
    println("完成!")
}