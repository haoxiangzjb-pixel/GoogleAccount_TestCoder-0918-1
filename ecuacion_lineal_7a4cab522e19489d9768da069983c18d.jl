# Función para resolver una ecuación lineal de la forma ax + b = c

function resolver_ecuacion_lineal(a::Real, b::Real, c::Real)
    if a == 0
        if b == c
            return "Infinitas soluciones"
        else
            return "Sin solución"
        end
    else
        x = (c - b) / a
        return x
    end
end
