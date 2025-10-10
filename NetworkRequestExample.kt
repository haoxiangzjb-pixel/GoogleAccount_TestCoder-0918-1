import kotlinx.coroutines.*
import java.io.File
import java.util.UUID

// A simple function to simulate a network request using delay
suspend fun fetchNetworkData(): String {
    println("Initiating network request...")
    delay(2000) // Simulate network delay
    val response = "{'status': 'success', 'data': 'Sample data from network'}"
    println("Network request completed.")
    return response
}

fun main() = runBlocking {
    val response = fetchNetworkData()

    // Generate a random UUID for the filename
    val fileName = "${UUID.randomUUID()}.kt"
    val file = File(fileName)

    // Write the response to the randomly named .kt file
    file.writeText("// Network request result\nval networkResult = \"$response\"\n")

    println("Response saved to file: $fileName")
}
