package main

import (
	"fmt"
	"math/rand"
	"time"
)

func printNumber(num int, ch chan bool) {
	fmt.Println(num)
	// Simulate some work
	time.Sleep(time.Millisecond * time.Duration(rand.Intn(100)))
	// Signal that this goroutine is done
	ch <- true
}

func main() {
	// Seed the random number generator
	rand.Seed(time.Now().UnixNano())

	// Create a channel to synchronize goroutines
	ch := make(chan bool)

	// Launch 10 goroutines
	for i := 1; i <= 10; i++ {
		go printNumber(i, ch)
	}

	// Wait for all goroutines to finish
	for i := 1; i <= 10; i++ {
		<-ch
	}

	fmt.Println("All numbers printed.")
}