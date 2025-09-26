<?php

class Car {
    private $isRunning = false;

    public function start() {
        if (!$this->isRunning) {
            $this->isRunning = true;
            echo "The car is now running.\n";
        } else {
            echo "The car is already running.\n";
        }
    }

    public function stop() {
        if ($this->isRunning) {
            $this->isRunning = false;
            echo "The car has stopped.\n";
        } else {
            echo "The car is already stopped.\n";
        }
    }

    public function isRunning() {
        return $this->isRunning;
    }
}

// Example usage:
// $myCar = new Car();
// $myCar->start(); // Output: The car is now running.
// $myCar->start(); // Output: The car is already running.
// var_dump($myCar->isRunning()); // Output: bool(true)
// $myCar->stop(); // Output: The car has stopped.
// var_dump($myCar->isRunning()); // Output: bool(false)
