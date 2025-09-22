Sub FormatSheet()
    Dim ws As Worksheet
    Set ws = ActiveSheet
    
    ' Format a range of cells
    With ws.Range("A1:D10")
        .Font.Bold = True
        .Font.Size = 12
        .Interior.Color = RGB(200, 200, 200) ' Light Gray background
        .Borders.LineStyle = xlContinuous
        .Borders.Weight = xlThin
    End With
    
    ' Auto-fit columns
    ws.Columns("A:D").AutoFit
    
    MsgBox "Sheet formatted!"
End Sub