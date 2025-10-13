// Класс для представления автомобиля
class Car {
  String brand;
  int year;

  // Конструктор класса
  Car(this.brand, this.year);

  // Метод для получения описания автомобиля
  String getDescription() {
    return 'Car: $brand, Year: $year';
  }
}

void main() {
  // Пример использования класса
  var myCar = Car('Toyota', 2022);
  print(myCar.getDescription());
}