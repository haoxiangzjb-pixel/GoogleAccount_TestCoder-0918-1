package main

import (
	"fmt"
)

func printNumbers(start, end int) {
	for i := start; i <= end; i++ {
		fmt.Println(i)
	}
}

func main() {
	// 启动一个Go协程来打印数字1到10
	go printNumbers(1, 10)

	// 主协程短暂休眠，确保其他协程有机会执行
	// 在实际应用中，应使用 WaitGroup 或 channel 来同步
	// 这里仅作演示，使用休眠来保证输出。
	// 注意：在生产代码中，休眠不是一个好的同步方法。
	// 为了确保协程执行完毕，我们简单地休眠一小段时间。
	// Go 的调度器通常会很快执行新启动的协程。
	
	// 为了确保程序不会立即退出，我们可以使用一个 channel 来等待。
	done := make(chan bool)
	go func() {
		printNumbers(1, 10)
		done <- true // 发送信号表示完成
	}()

	<-done // 等待协程完成
}