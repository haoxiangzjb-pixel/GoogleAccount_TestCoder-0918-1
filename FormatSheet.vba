Sub FormatSheet()
    ' Set the sheet name (change "Sheet1" to your sheet's name if different)
    Dim ws As Worksheet
    Set ws = ActiveSheet ' Or use Worksheets("Sheet1") if you want a specific sheet

    ' Format header row (Row 1)
    With ws.Rows(1)
        .Font.Bold = True
        .Interior.Color = RGB(200, 200, 200) ' Light grey background
        .HorizontalAlignment = xlCenter
    End With

    ' Auto-fit all columns
    ws.Columns.AutoFit

    ' Format numeric columns (e.g., columns B and C)
    ' This example formats columns B and C as Currency
    ws.Columns("B:C").NumberFormat = "$#,##0.00"

    ' Add borders to the used range
    ws.UsedRange.Borders.LineStyle = xlContinuous

    ' Center align text in column A
    ws.Columns("A").HorizontalAlignment = xlCenter

    MsgBox "Formatting Complete!"
End Sub