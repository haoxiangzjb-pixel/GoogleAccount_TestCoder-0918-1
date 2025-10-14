Attribute VB_Name = "SumFunction"
' Function to calculate the sum of cells in a given range
Public Function SumCells(rng As Range) As Double
    SumCells = Application.WorksheetFunction.Sum(rng)
End Function