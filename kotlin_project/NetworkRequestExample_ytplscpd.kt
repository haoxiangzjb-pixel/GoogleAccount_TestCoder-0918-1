import kotlinx.coroutines.*
import java.net.http.*
import java.net.URI
import java.time.Duration

// 定义一个数据类来接收JSON响应
data class Post(val userId: Int, val id: Int, val title: String, val body: String)

fun main() = runBlocking {
    // 启动一个协程来执行网络请求
    val deferredResponse = async {
        fetchData()
    }

    // 在协程之外做一些其他事情
    println("正在执行其他任务...")

    // 等待网络请求的结果
    try {
        val post = deferredResponse.await()
        println("请求成功，获取到的数据: $post")
    } catch (e: Exception) {
        println("请求失败: ${e.message}")
    }
}

suspend fun fetchData(): Post {
    return withContext(Dispatchers.IO) {
        val client = HttpClient.newBuilder()
            .connectTimeout(Duration.ofSeconds(5))
            .build()

        val request = HttpRequest.newBuilder()
            .uri(URI("https://jsonplaceholder.typicode.com/posts/1"))
            .timeout(Duration.ofSeconds(5))
            .GET()
            .build()

        val response = client.send(request, HttpResponse.BodyHandlers.ofString())
        if (response.statusCode() == 200) {
            // 简化的JSON解析，实际项目中应使用库如Gson或Jackson
            val body = response.body()
            val userId = body.substringAfter("\"userId\":").substringBefore(",").trim().toInt()
            val id = body.substringAfter("\"id\":").substringBefore(",").trim().toInt()
            val title = body.substringAfter("\"title\":\"").substringBefore("\",").trim()
            val postBody = body.substringAfter("\"body\":\"").substringBeforeLast("\"}").trim()
            Post(userId, id, title, postBody)
        } else {
            throw Exception("HTTP Error: ${response.statusCode()}")
        }
    }
}