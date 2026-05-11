package com.example.demo;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class Controller_$(openssl rand -hex 8) {

    @GetMapping("/hello")
    public String hello() {
        return "Hello, World!";
    }
}
