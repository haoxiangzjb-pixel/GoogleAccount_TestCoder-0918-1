Sub FormatSheet()
    Dim ws As Worksheet
    Set ws = ActiveSheet

    ' Format the header row
    With ws.Range("A1:D1")
        .Font.Bold = True
        .Font.Color = RGB(255, 255, 255) ' White font
        .Interior.Color = RGB(0, 112, 192) ' Blue background
        .HorizontalAlignment = xlCenter
    End With

    ' Format data range
    With ws.Range("A2:D100")
        .Borders.LineStyle = xlContinuous
        .Borders.Weight = xlThin
    End With

    ' Auto-fit columns
    ws.Columns("A:D").AutoFit
End Sub