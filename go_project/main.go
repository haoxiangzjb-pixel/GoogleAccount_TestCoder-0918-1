package main

import (
	"fmt"
	"math/rand"
	"time"
)

func printNumber(num int, ch chan bool) {
	// 模拟一些工作，让协程执行时间稍微错开
	time.Sleep(time.Duration(rand.Intn(500)) * time.Millisecond)
	fmt.Println(num)
	ch <- true
}

func main() {
	rand.Seed(time.Now().UnixNano()) // 初始化随机数种子

	ch := make(chan bool)

	for i := 1; i <= 10; i++ {
		go printNumber(i, ch)
	}

	// 等待所有协程完成
	for i := 1; i <= 10; i++ {
		<-ch
	}

	fmt.Println("All numbers printed.")
}