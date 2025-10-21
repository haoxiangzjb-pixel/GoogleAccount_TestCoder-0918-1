' VBA function to calculate the sum of cells in a given range
Function SumCells(rng As Range) As Double
    Dim cell As Range
    Dim total As Double
    
    total = 0
    
    ' Loop through each cell in the range and add its value to the total
    For Each cell In rng
        If IsNumeric(cell.Value) Then
            total = total + cell.Value
        End If
    Next cell
    
    SumCells = total
End Function

' Alternative more efficient version using Application.WorksheetFunction
Function SumCellsEfficient(rng As Range) As Double
    SumCellsEfficient = Application.WorksheetFunction.Sum(rng)
End Function

' Subroutine to demonstrate usage
Sub TestSumFunction()
    Dim result As Double
    result = SumCells(Range("A1:A10"))
    MsgBox "Sum of A1:A10 is: " & result
End Sub