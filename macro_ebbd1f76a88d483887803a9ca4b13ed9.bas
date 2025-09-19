Sub FormatSheet()

    Dim ws As Worksheet
    Set ws = ActiveSheet

    ' Format the header row
    With ws.Range("A1:E1")
        .Font.Bold = True
        .Font.Size = 12
        .Interior.Color = RGB(200, 200, 200)
        .Borders(xlEdgeBottom).LineStyle = xlContinuous
    End With

    ' Auto-fit columns
    ws.Columns("A:E").AutoFit

    ' Format data rows
    Dim lastRow As Long
    lastRow = ws.Cells(ws.Rows.Count, "A").End(xlUp).Row

    Dim i As Long
    For i = 2 To lastRow
        If i Mod 2 = 0 Then
            ws.Rows(i).Interior.Color = RGB(240, 240, 240) ' Light grey for even rows
        Else
            ws.Rows(i).Interior.Color = RGB(255, 255, 255) ' White for odd rows
        End If
    Next i

    ' Add a border around the entire data range
    ws.Range("A1:E" & lastRow).Borders.LineStyle = xlContinuous

    MsgBox "Sheet formatting complete!"

End Sub