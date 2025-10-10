import kotlinx.coroutines.*
import java.io.File
import java.util.*

// A simple script to perform a network request using Kotlin Coroutines and save the result to a file.
// Note: This script requires the Kotlinx Coroutines library to run.
// Example command to run: kotlinc -cp .:kotlinx-coroutines-core-jvm-1.7.3.jar:. network_request_script.kt -script

fun main() = runBlocking {
    // Simulate a network request using async
    val deferredResult = async {
        delay(1000) // Simulate network delay
        "Sample data from a network request."
    }

    // Await the result
    val result = deferredResult.await()

    // Generate a random filename
    val randomFileName = "output_${UUID.randomUUID()}.txt"

    // Write the result to the file
    File(randomFileName).writeText(result)

    println("Network request result saved to $randomFileName")
}