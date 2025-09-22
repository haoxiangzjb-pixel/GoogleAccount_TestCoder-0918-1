import 'dart_car_class.dart';

void main() {
  // Создаем экземпляр класса Dart
  Dart myCar = Dart(brand: 'Toyota', year: 2020);
  
  // Отображаем информацию об автомобиле
  myCar.displayInfo();
  
  // Создаем еще один экземпляр без указания параметров
  Dart anotherCar = Dart();
  anotherCar.displayInfo();
}