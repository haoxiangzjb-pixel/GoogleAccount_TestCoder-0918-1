#include "rectangulo.h"

// Constructor
Rectangulo::Rectangulo(double l, double a) : largo(l), ancho(a) {}

// Método para calcular el área
double Rectangulo::area() const {
    return largo * ancho;
}

// Método para calcular el perímetro
double Rectangulo::perimetro() const {
    return 2 * (largo + ancho);
}