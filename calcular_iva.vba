' Función para calcular el IVA
Function CalcularIVA(importe As Double, Optional tasaIVA As Double = 0.19) As Double
    ' Calcula el monto de IVA basado en el importe y la tasa de IVA
    CalcularIVA = importe * tasaIVA
End Function

' Función para calcular el total con IVA incluido
Function CalcularTotalConIVA(importe As Double, Optional tasaIVA As Double = 0.19) As Double
    ' Calcula el total sumando el importe original más el IVA
    CalcularTotalConIVA = importe + (importe * tasaIVA)
End Function

' Subrutina de ejemplo para demostrar el uso de las funciones
Sub EjemploUsoIVA()
    Dim importeOriginal As Double
    Dim ivaCalculado As Double
    Dim totalConIVA As Double
    
    ' Ejemplo de cálculo
    importeOriginal = 1000 ' por ejemplo, 1000 unidades monetarias
    
    ivaCalculado = CalcularIVA(importeOriginal, 0.19) ' IVA del 19%
    totalConIVA = CalcularTotalConIVA(importeOriginal, 0.19) ' Total con IVA
    
    ' Mostrar resultados
    Debug.Print "Importe original: " & importeOriginal
    Debug.Print "IVA calculado: " & ivaCalculado
    Debug.Print "Total con IVA: " & totalConIVA
End Sub