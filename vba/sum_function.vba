Function SumCells(rng As Range) As Double
    ' Function to calculate the sum of cells in a given range
    Dim cell As Range
    SumCells = 0
    For Each cell In rng
        If IsNumeric(cell.Value) Then
            SumCells = SumCells + cell.Value
        End If
    Next cell
End Function