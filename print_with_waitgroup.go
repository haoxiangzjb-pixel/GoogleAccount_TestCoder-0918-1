package main

import (
	"fmt"
	"sync"
)

func printNumber(num int, wg *sync.WaitGroup) {
	defer wg.Done()
	fmt.Println(num)
}

func main() {
	var wg sync.WaitGroup
	
	// 使用协程打印数字1到10
	for i := 1; i <= 10; i++ {
		wg.Add(1)
		go printNumber(i, &wg)
	}
	
	// 等待所有协程完成
	wg.Wait()
}