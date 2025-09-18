package main

import (
	"fmt"
	"math/rand"
	"time"
)

func printNumbers(id int, ch <-chan int, done chan<- bool) {
	for num := range ch {
		fmt.Printf("Worker %d: %d\n", id, num)
		// 模拟一些工作
		time.Sleep(time.Millisecond * time.Duration(rand.Intn(100)))
	}
	done <- true
}

func main() {
	rand.Seed(time.Now().UnixNano())

	// 创建一个带缓冲的通道，容量为10
	numbers := make(chan int, 10)
	// 创建一个用于通知完成的通道
	done := make(chan bool)

	// 启动3个worker协程
	for i := 1; i <= 3; i++ {
		go printNumbers(i, numbers, done)
	}

	// 主协程向通道发送数字1到10
	for i := 1; i <= 10; i++ {
		numbers <- i
	}
	// 关闭通道，通知worker协程没有更多数据
	close(numbers)

	// 等待所有worker协程完成
	for i := 1; i <= 3; i++ {
		<-done
	}

	fmt.Println("All numbers printed.")
}