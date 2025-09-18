<?php

class Car {
    private $isRunning = false;

    public function start() {
        if ($this->isRunning) {
            echo "汽车已在运行中。\n";
        } else {
            $this->isRunning = true;
            echo "汽车启动成功。\n";
        }
    }

    public function stop() {
        if (!$this->isRunning) {
            echo "汽车已停止。\n";
        } else {
            $this->isRunning = false;
            echo "汽车停止成功。\n";
        }
    }

    public function getStatus() {
        return $this->isRunning ? "运行中" : "已停止";
    }
}

// 示例用法
// $myCar = new Car();
// $myCar->start();
// echo "当前状态: " . $myCar->getStatus() . "\n";
// $myCar->start(); // 尝试再次启动
// $myCar->stop();
// echo "当前状态: " . $myCar->getStatus() . "\n";

?>