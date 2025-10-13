import kotlinx.coroutines.*
import io.ktor.client.*
import io.ktor.client.request.*

fun main() = runBlocking {
    val client = HttpClient()

    try {
        val response: String = client.get("https://httpbin.org/get") {
            // Optional: Add headers or parameters here
        }
        println("Response status: OK")
        println("Response body: $response")

        // Save the response to a random-named .kt file
        val randomFileName = "NetworkResponse_${(1000..9999).random()}.kt"
        val filePath = "/workspace/network_requests/$randomFileName"
        java.io.File(filePath).writeText("// Network Response saved at: ${java.time.LocalDateTime.now()}\n\nval responseBody = \"$response\"\n")
        println("Response saved to file: $randomFileName")

    } catch (e: Exception) {
        println("An error occurred: ${e.message}")
    } finally {
        client.close()
    }
}