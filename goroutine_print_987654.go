package main

import (
	"fmt"
	"time"
)

func printNumbers() {
	for i := 1; i <= 10; i++ {
		fmt.Println(i)
		time.Sleep(100 * time.Millisecond) // 添加短暂延迟以观察并发效果
	}
}

func main() {
	go printNumbers() // 启动一个协程来执行 printNumbers 函数
	printNumbers()    // 在主协程中也执行一次，以展示并发
}