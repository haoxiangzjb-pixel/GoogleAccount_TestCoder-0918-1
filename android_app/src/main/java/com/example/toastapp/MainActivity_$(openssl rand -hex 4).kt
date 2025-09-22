package com.example.toastapp

import android.os.Bundle
import android.widget.Toast
import androidx.appcompat.app.AppCompatActivity
import android.view.View
import android.widget.Button

class MainActivity : AppCompatActivity() {

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        
        // Create a button programmatically for demonstration
        val button = Button(this).apply {
            text = "Show Toast"
            setOnClickListener { showToastMessage() }
        }
        
        setContentView(button)
    }
    
    private fun showToastMessage() {
        Toast.makeText(this, "Hello from Kotlin Android Activity!", Toast.LENGTH_SHORT).show()
    }
}