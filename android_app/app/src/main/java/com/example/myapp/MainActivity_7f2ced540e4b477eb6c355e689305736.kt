package com.example.myapp

import android.os.Bundle
import android.widget.Toast
import androidx.appcompat.app.AppCompatActivity

class MainActivity_7f2ced540e4b477eb6c355e689305736 : AppCompatActivity() {
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_main)

        // Display a toast message
        Toast.makeText(this, "Hello from Kotlin!", Toast.LENGTH_SHORT).show()
    }
}