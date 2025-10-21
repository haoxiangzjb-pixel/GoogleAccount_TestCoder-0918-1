' VBA function to calculate the sum of cells in a given range
Function CalculateSum(rng As Range) As Double
    Dim cell As Range
    Dim total As Double
    
    total = 0
    
    ' Loop through each cell in the range and add its value to the total
    For Each cell In rng
        If IsNumeric(cell.Value) Then
            total = total + cell.Value
        End If
    Next cell
    
    CalculateSum = total
End Function

' More efficient version using built-in Excel function
Function EfficientSum(rng As Range) As Double
    EfficientSum = Application.WorksheetFunction.Sum(rng)
End Function

' Example subroutine to demonstrate usage
Sub ShowSum()
    Dim result As Double
    result = CalculateSum(Range("B1:B5"))
    MsgBox "The sum of the range B1:B5 is: " & result
End Sub