import kotlinx.coroutines.*
import org.jsoup.Jsoup
import java.io.IOException

/**
 * 一个使用Kotlin协程发起网络请求的示例。
 * 此示例使用Jsoup库来获取一个网页的标题。
 */
suspend fun fetchWebPageTitle(url: String): String? {
    return try {
        // Dispatchers.IO 用于执行阻塞的I/O操作
        withContext(Dispatchers.IO) {
            val document = Jsoup.connect(url).get()
            document.title()
        }
    } catch (e: IOException) {
        println("网络请求失败: ${e.message}")
        null
    }
}

fun main() = runBlocking {
    println("开始发起网络请求...")

    // 使用async启动一个并发的协程来执行网络请求
    val deferredTitle1 = async { fetchWebPageTitle("https://httpbin.org/html") }
    val deferredTitle2 = async { fetchWebPageTitle("https://example.com") }

    // 等待结果
    val title1 = deferredTitle1.await()
    val title2 = deferredTitle2.await()

    println("第一个页面标题: $title1")
    println("第二个页面标题: $title2")

    println("所有请求完成。")
}