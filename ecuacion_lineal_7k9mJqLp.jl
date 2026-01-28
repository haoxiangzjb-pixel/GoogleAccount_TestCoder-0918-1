# Función para resolver ecuaciones lineales de la forma ax + b = 0
function resolver_ecuacion_lineal(a, b)
    if a == 0
        if b == 0
            return "Infinitas soluciones (ecuación identidad)"
        else
            return "No hay solución (ecuación imposible)"
        end
    else
        x = -b / a
        return x
    end
end

# Ejemplo de uso
println("Ejemplo: Resolver 2x + 4 = 0")
resultado = resolver_ecuacion_lineal(2, 4)
println("Solución: x = $resultado")
