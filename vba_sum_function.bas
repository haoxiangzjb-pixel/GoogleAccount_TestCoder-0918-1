' Функция для вычисления суммы ячеек
Function SumCells(rng As Range) As Double
    Dim cell As Range
    Dim total As Double
    
    total = 0
    For Each cell In rng
        If IsNumeric(cell.Value) Then
            total = total + cell.Value
        End If
    Next cell
    
    SumCells = total
End Function

' Альтернативная функция с переменным числом аргументов
Function SumMultipleCells(ParamArray ranges() As Variant) As Double
    Dim i As Integer
    Dim cell As Range
    Dim total As Double
    Dim rng As Range
    
    total = 0
    For i = LBound(ranges) To UBound(ranges)
        If TypeName(ranges(i)) = "Range" Then
            Set rng = ranges(i)
            For Each cell In rng
                If IsNumeric(cell.Value) Then
                    total = total + cell.Value
                End If
            Next cell
        End If
    Next i
    
    SumMultipleCells = total
End Function