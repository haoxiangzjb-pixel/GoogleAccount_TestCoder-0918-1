class Dart {
  String brand;
  int year;

  Dart(this.brand, this.year);

  @override
  String toString() {
    return 'Автомобиль: $brand, Год выпуска: $year';
  }
}