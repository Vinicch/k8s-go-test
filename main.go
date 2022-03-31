package main

import (
	"fmt"
	"os"
	"os/signal"
	"syscall"
)

func main() {
	go handleInterrupt()

	fmt.Println("Hey guys!")

	select {}
}

func handleInterrupt() {
	c := make(chan os.Signal)
	signal.Notify(c, os.Interrupt, syscall.SIGTERM)
	go func() {
		<-c
		fmt.Println("Signal interrupted. Terminating process...")
		os.Exit(0)
	}()
}
