package com.example.demo;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class Controller_b4c8b0fbcad490d2 {

    @GetMapping("/hello")
    public String hello() {
        return "Hello, World!";
    }
}
