class Dart {
  String? brand;
  int? year;

  // Конструктор
  Dart({this.brand, this.year});

  // Метод для отображения информации об автомобиле
  void displayInfo() {
    print('Марка: ${brand ?? "Не указана"}, Год: ${year ?? "Не указан"}');
  }
}