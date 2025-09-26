Sub FormatSheet()
    '
    ' FormatSheet Macro
    '

    '
    ' Set headers
    '
    Cells(1, 1).Value = "Name"
    Cells(1, 2).Value = "Age"
    Cells(1, 3).Value = "City"
    
    '
    ' Format headers
    '
    With Range("A1:C1")
        .Font.Bold = True
        .Interior.Color = RGB(200, 200, 200)
        .HorizontalAlignment = xlCenter
    End With
    
    '
    ' Auto-fit columns
    '
    Columns("A:C").AutoFit
    
    '
    ' Add some sample data
    '
    Cells(2, 1).Value = "John Doe"
    Cells(2, 2).Value = 30
    Cells(2, 3).Value = "New York"
    
    Cells(3, 1).Value = "Jane Smith"
    Cells(3, 2).Value = 25
    Cells(3, 3).Value = "Los Angeles"
    
End Sub