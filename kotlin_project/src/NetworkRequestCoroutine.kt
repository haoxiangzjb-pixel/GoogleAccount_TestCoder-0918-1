import kotlinx.coroutines.*
import java.net.URL
import java.util.Scanner
import java.io.File
import kotlin.random.Random

// 模拟网络请求的挂起函数
suspend fun fetchData(url: String): String {
    return withContext(Dispatchers.IO) {
        try {
            val connection = URL(url).openStream()
            val scanner = Scanner(connection, "UTF-8").useDelimiter("\\A")
            val data = if (scanner.hasNext()) scanner.next() else ""
            scanner.close()
            data
        } catch (e: Exception) {
            "Error fetching data: ${e.message}"
        }
    }
}

// 生成随机的Kotlin文件名
fun generateRandomFileName(): String {
    val chars = ('a'..'z') + ('A'..'Z') + ('0'..'9')
    val randomString = (1..10)
        .map { chars.random() }
        .joinToString("")
    return "NetworkResult_$randomString.kt"
}

fun main() = runBlocking {
    val url = "https://httpbin.org/get" // 示例API
    println("Starting network request to $url...")

    val data = fetchData(url)
    println("Data received.")

    val fileName = generateRandomFileName()
    val filePath = "/workspace/kotlin_project/src/$fileName"
    println("Saving to file: $filePath")

    val file = File(filePath)
    file.writeText(data)
    println("Data saved successfully!")
}