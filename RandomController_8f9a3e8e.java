package com.example.demo;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/api")
public class RandomController_8f9a3e8e {

    @GetMapping("/hello")
    public String hello() {
        return "Hello, World!";
    }
}
