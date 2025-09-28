package main

import (
	"fmt"
)

func printNum(i int, ch chan bool) {
	fmt.Println(i)
	ch <- true
}

func main() {
	ch := make(chan bool)

	for i := 1; i <= 10; i++ {
		go printNum(i, ch)
	}

	for i := 1; i <= 10; i++ {
		<-ch
	}
}