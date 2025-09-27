// This file demonstrates a basic Kotlin coroutine making a network request.
// Note: This is example code and may require a proper Kotlin environment with Ktor or OkHttp to run.

import kotlinx.coroutines.*

fun main() = runBlocking {
    val response = async {
        // Simulate a network request delay
        delay(1000)
        "Simulated Network Response Data"
    }
    val data = response.await()
    println("Data received: $data")
}
