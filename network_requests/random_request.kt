import io.ktor.client.*
import io.ktor.client.engine.cio.*
import io.ktor.client.plugins.contentnegotiation.*
import io.ktor.client.request.*
import io.ktor.http.*
import io.ktor.serialization.kotlinx.json.*
import kotlinx.coroutines.*

class NetworkRequest {
    private val client = HttpClient(CIO) {
        install(ContentNegotiation) {
            json()
        }
    }

    suspend fun fetchData(): String {
        val response: String = client.get("https://httpbin.org/get") {
            contentType(ContentType.Application.Json)
        }.body()
        return response
    }

    suspend fun performRequestAndSave() {
        println("发起网络请求...")
        val data = fetchData()
        println("请求完成，数据已保存。")
        println(data)
    }
}

fun main() = runBlocking {
    val networkRequest = NetworkRequest()
    networkRequest.performRequestAndSave()
}