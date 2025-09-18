package com.example.demo;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class RandomController {

    @GetMapping("/greeting")
    public String greeting() {
        return "Hello, World! This is a Spring Boot REST endpoint.";
    }
}