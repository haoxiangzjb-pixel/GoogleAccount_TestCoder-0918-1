package main

import (
	"fmt"
	"time"
)

func printNumber(num int) {
	fmt.Println(num)
}

func main() {
	// 启动10个goroutines来打印数字1到10
	for i := 1; i <= 10; i++ {
		go printNumber(i)
	}
	
	// 等待所有goroutines完成
	time.Sleep(100 * time.Millisecond)
}