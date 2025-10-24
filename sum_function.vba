' VBA Function to calculate sum of cells
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

' Alternative function that takes a range as string
Function SumRange(rangeString As String) As Double
    Dim rng As Range
    Dim cell As Range
    Dim total As Double
    
    Set rng = Range(rangeString)
    total = 0
    
    For Each cell In rng
        If IsNumeric(cell.Value) Then
            total = total + cell.Value
        End If
    Next cell
    
    SumRange = total
End Function