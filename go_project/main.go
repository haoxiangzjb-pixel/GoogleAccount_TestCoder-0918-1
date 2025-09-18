package main

import (
	"fmt"
	"math/rand"
	"sync"
	"time"
)

func main() {
	// 使用随机数生成器，根据当前时间进行种子设置
	rand.Seed(time.Now().UnixNano())

	// 创建一个等待组，用于等待所有协程完成
	var wg sync.WaitGroup

	// 启动10个协程
	for i := 1; i <= 10; i++ {
		wg.Add(1) // 每启动一个协程，计数器加1
		// 启动一个匿名函数作为协程
		go func(num int) {
			defer wg.Done() // 协程结束时，计数器减1

			// 为每个协程生成一个随机的睡眠时间（0到1000毫秒）
			sleepTime := time.Duration(rand.Intn(1000)) * time.Millisecond
			time.Sleep(sleepTime)

			// 打印数字
			fmt.Println(num)
		}(i) // 将循环变量i的当前值传递给协程
	}

	// 等待所有协程完成
	wg.Wait()
	fmt.Println("All numbers printed.")
}