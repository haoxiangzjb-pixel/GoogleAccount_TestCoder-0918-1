<?php

class Car {
    private $brand;
    private $model;
    private $isRunning;
    
    public function __construct($brand, $model) {
        $this->brand = $brand;
        $this->model = $model;
        $this->isRunning = false;
    }
    
    public function start() {
        if ($this->isRunning) {
            return "汽车已经在运行中";
        } else {
            $this->isRunning = true;
            return $this->brand . " " . $this->model . " 启动成功";
        }
    }
    
    public function stop() {
        if (!$this->isRunning) {
            return "汽车已经停止";
        } else {
            $this->isRunning = false;
            return $this->brand . " " . $this->model . " 停止成功";
        }
    }
    
    public function getBrand() {
        return $this->brand;
    }
    
    public function getModel() {
        return $this->model;
    }
    
    public function isRunning() {
        return $this->isRunning;
    }
}

// 使用示例
// $car = new Car("丰田", "卡罗拉");
// echo $car->start();  // 启动汽车
// echo $car->stop();   // 停止汽车

?>