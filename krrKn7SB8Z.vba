' VBA Function to calculate sum of cells
Function CalculateSum(rng As Range) As Double
    Dim cell As Range
    Dim total As Double
    
    total = 0
    
    For Each cell In rng
        If IsNumeric(cell.Value) Then
            total = total + cell.Value
        End If
    Next cell
    
    CalculateSum = total
End Function

' Subroutine to demonstrate usage
Sub ExampleUsage()
    Dim result As Double
    result = CalculateSum(Range("A1:A10"))
    MsgBox "The sum is: " & result
End Sub