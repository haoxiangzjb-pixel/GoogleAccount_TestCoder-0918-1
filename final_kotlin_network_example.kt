import kotlinx.coroutines.*
import org.jsoup.Jsoup
import java.io.File
import java.util.*

// 使用Kotlin协程发起网络请求的函数
suspend fun fetchData(): String {
    return withContext(Dispatchers.IO) {
        try {
            // 使用Jsoup发起HTTP请求，获取一个公开API的数据
            val doc = Jsoup.connect("https://jsonplaceholder.typicode.com/todos/1")
                .timeout(10000) // 10秒超时
                .ignoreContentType(true) // 忽略内容类型检查
                .get()
            doc.body().text() // 获取响应体文本
        } catch (e: Exception) {
            "网络请求失败: ${'$'}{e.message}"
        }
    }
}

// 生成随机文件名的函数
fun generateRandomFileName(): String {
    val random = Random()
    val sb = StringBuilder()
    repeat(10) {
        sb.append(('a'..'z').random())
    }
    return "${'$'}sb.kt"
}

// 主函数
fun main() = runBlocking {
    println("发起网络请求...")
    
    // 发起网络请求
    val data = fetchData()
    
    // 生成随机文件名
    val randomFileName = generateRandomFileName()
    println("生成随机文件名: ${'$'}randomFileName")
    
    // 将数据保存到随机命名的.kt文件中
    val file = File(randomFileName)
    file.writeText("// 网络请求结果\nval networkResponse = \"\"\"${'$'}data\"\"\"")
    
    println("网络请求结果已保存到文件: ${'$'}randomFileName")
    println("文件内容:\n${'$'}{file.readText()}")
}