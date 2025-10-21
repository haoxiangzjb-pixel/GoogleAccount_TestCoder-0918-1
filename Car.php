<?php

class Car {
    private $brand;
    private $model;
    private $isRunning = false;
    
    public function __construct($brand = "Unknown", $model = "Unknown") {
        $this->brand = $brand;
        $this->model = $model;
    }
    
    public function start() {
        if (!$this->isRunning) {
            $this->isRunning = true;
            echo "The {$this->brand} {$this->model} engine has started.\n";
        } else {
            echo "The {$this->brand} {$this->model} engine is already running.\n";
        }
    }
    
    public function stop() {
        if ($this->isRunning) {
            $this->isRunning = false;
            echo "The {$this->brand} {$this->model} engine has stopped.\n";
        } else {
            echo "The {$this->brand} {$this->model} engine is already stopped.\n";
        }
    }
    
    public function getStatus() {
        return $this->isRunning ? "running" : "stopped";
    }
    
    public function getBrand() {
        return $this->brand;
    }
    
    public function getModel() {
        return $this->model;
    }
}

// Example usage:
$myCar = new Car("Toyota", "Camry");
echo "Car: " . $myCar->getBrand() . " " . $myCar->getModel() . "\n";
echo "Status: " . $myCar->getStatus() . "\n";
$myCar->start();
echo "Status: " . $myCar->getStatus() . "\n";
$myCar->start(); // Try starting again
$myCar->stop();
echo "Status: " . $myCar->getStatus() . "\n";