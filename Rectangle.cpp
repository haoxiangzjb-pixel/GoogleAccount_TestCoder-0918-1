#include <iostream>

class Rectangle {
private:
    double width;
    double height;

public:
    // Constructor
    Rectangle(double w, double h) : width(w), height(h) {}

    // Method to calculate area
    double getArea() const {
        return width * height;
    }

    // Method to calculate perimeter
    double getPerimeter() const {
        return 2 * (width + height);
    }

    // Getter methods
    double getWidth() const { return width; }
    double getHeight() const { return height; }

    // Setter methods
    void setWidth(double w) { width = w; }
    void setHeight(double h) { height = h; }
};

int main() {
    // Example usage
    Rectangle rect(5.0, 3.0);
    
    std::cout << "Rectangle dimensions: " << rect.getWidth() << " x " << rect.getHeight() << std::endl;
    std::cout << "Area: " << rect.getArea() << std::endl;
    std::cout << "Perimeter: " << rect.getPerimeter() << std::endl;
    
    return 0;
}