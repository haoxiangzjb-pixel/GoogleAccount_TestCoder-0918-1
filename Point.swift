import Foundation

struct Point {
    var x: Double
    var y: Double
}

// Пример использования
let point1 = Point(x: 1.5, y: 2.7)
let point2 = Point(x: -3.0, y: 4.2)

print("Точка 1: (\(point1.x), \(point1.y))")
print("Точка 2: (\(point2.x), \(point2.y))")

// Функция для вычисления расстояния между двумя точками
func distance(from p1: Point, to p2: Point) -> Double {
    let dx = p2.x - p1.x
    let dy = p2.y - p1.y
    return sqrt(dx * dx + dy * dy)
}

let distanceBetweenPoints = distance(from: point1, to: point2)
print("Расстояние между точками: \(distanceBetweenPoints)")