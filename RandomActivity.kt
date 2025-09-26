package com.example.random

import android.os.Bundle
import android.widget.Toast
import androidx.appcompat.app.AppCompatActivity

class RandomActivity : AppCompatActivity() {
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_main) // You might need to create this layout or set content differently

        val toast = Toast.makeText(this, "Hello from RandomActivity!", Toast.LENGTH_SHORT)
        toast.show()
    }
}