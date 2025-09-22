package main

import (
	"fmt"
	"math/rand"
	"sync"
	"time"
)

func main() {
	// 使用 WaitGroup 等待所有协程完成
	var wg sync.WaitGroup

	// 启动10个协程
	for i := 1; i <= 10; i++ {
		wg.Add(1) // 增加计数器
		// 启动一个匿名函数作为协程
		go func(num int) {
			defer wg.Done() // 协程结束时减少计数器
			// 为每个协程引入一点随机延迟，使输出顺序更明显
			time.Sleep(time.Duration(rand.Intn(500)) * time.Millisecond)
			fmt.Println(num)
		}(i) // 将循环变量 i 作为参数传递给匿名函数
	}

	// 等待所有协程执行完毕
	wg.Wait()
	fmt.Println("All goroutines finished.")
}