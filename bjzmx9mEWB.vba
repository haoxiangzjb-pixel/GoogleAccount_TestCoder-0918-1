Sub FormatExcelSheet()
    ' This macro formats an Excel sheet with common formatting options
    
    Dim ws As Worksheet
    Set ws = ActiveSheet
    
    ' Format the header row
    With ws.Range("A1:E1")
        .Font.Bold = True
        .Font.Size = 12
        .Interior.Color = RGB(180, 180, 180)
        .Borders.LineStyle = xlContinuous
    End With
    
    ' Auto-fit columns
    ws.Columns("A:E").AutoFit
    
    ' Format data range
    With ws.Range("A2:E100")
        .Borders.LineStyle = xlContinuous
        .Borders.Weight = xlThin
    End With
    
    ' Center align all cells
    ws.Range("A1:E100").HorizontalAlignment = xlCenter
    
    ' Add alternating row colors
    Dim i As Long
    For i = 2 To ws.UsedRange.Rows.Count
        If i Mod 2 = 0 Then
            ws.Range("A" & i & ":E" & i).Interior.Color = RGB(240, 240, 240)
        End If
    Next i
    
    MsgBox "Sheet formatting complete!"
End Sub