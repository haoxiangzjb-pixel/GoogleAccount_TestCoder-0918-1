package com.example.activity

import android.os.Bundle
import android.widget.Toast
import androidx.appcompat.app.AppCompatActivity

class MyDisplayActivity : AppCompatActivity() {
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        // The activity does not have a UI, it just shows a toast.
        Toast.makeText(this, "Hello from MyDisplayActivity!", Toast.LENGTH_SHORT).show()
    }
}