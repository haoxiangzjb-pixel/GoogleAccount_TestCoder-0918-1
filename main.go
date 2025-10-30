package main

import (
	"fmt"
	"math/rand"
	"os"
	"time"
)

func producer(ch chan<- string, count int) {
	for i := 1; i <= count; i++ {
		message := fmt.Sprintf("Mensagem %d produzida pela goroutine", i)
		ch <- message
		time.Sleep(time.Millisecond * 500) // Simula algum trabalho
	}
	close(ch) // Fecha o canal quando terminar
}

func consumer(ch <-chan string, done chan<- string) {
	var content string
	for message := range ch { // Lê do canal até que ele seja fechado
		fmt.Println("Recebido:", message)
		content += message + "\n"
	}
	done <- content // Envia o conteúdo para ser salvo
}

func main() {
	// Canal para comunicação entre goroutines
	messages := make(chan string, 5)
	
	// Canal para receber o conteúdo a ser salvo
	done := make(chan string)
	
	// Inicia a goroutine produtora
	go producer(messages, 10)
	
	// Inicia a goroutine consumidora
	go consumer(messages, done)
	
	// Recebe o conteúdo
	content := <-done
	
	// Gera um nome de arquivo aleatório
	rand.Seed(time.Now().UnixNano())
	filename := fmt.Sprintf("arquivo_%d.txt", rand.Intn(10000))
	
	// Salva o conteúdo no arquivo
	err := os.WriteFile(filename, []byte(content), 0644)
	if err != nil {
		fmt.Printf("Erro ao escrever arquivo: %v\n", err)
		return
	}
	
	fmt.Printf("Conteúdo salvo no arquivo: %s\n", filename)
}