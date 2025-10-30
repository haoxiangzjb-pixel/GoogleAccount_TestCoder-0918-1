#ifndef RECTANGULO_H
#define RECTANGULO_H

class Rectangulo {
private:
    double largo;
    double ancho;

public:
    // Constructor
    Rectangulo(double l, double a);

    // Métodos
    double area() const;
    double perimetro() const;
};

#endif // RECTANGULO_H