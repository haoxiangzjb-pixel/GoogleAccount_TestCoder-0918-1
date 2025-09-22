Attribute VB_Name = "SumModule"
' VBA Function to calculate sum of cells
'
' This module contains a function to calculate the sum of values in a range of cells

Function CalculateSum(rng As Range) As Double
    ' Declare variables
    Dim cell As Range
    Dim total As Double
    
    ' Initialize total
    total = 0
    
    ' Loop through each cell in the range
    For Each cell In rng
        ' Add cell value to total (ignore non-numeric values)
        If IsNumeric(cell.Value) Then
            total = total + cell.Value
        End If
    Next cell
    
    ' Return the calculated sum
    CalculateSum = total
End Function

Function CalculateSumSimple(rng As Range) As Double
    ' Simplified version using Excel's built-in SUM function
    CalculateSumSimple = Application.WorksheetFunction.Sum(rng)
End Function