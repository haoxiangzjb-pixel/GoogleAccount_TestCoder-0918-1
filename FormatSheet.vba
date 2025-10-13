Sub FormatSheet()
    ' Set the name of the worksheet you want to format
    Dim ws As Worksheet
    Set ws = ActiveSheet ' Or use Worksheets("Sheet1") for a specific sheet

    ' Format headers in row 1
    With ws.Rows(1)
        .Font.Bold = True
        .Interior.Color = RGB(0, 100, 200) ' Blue background
        .Font.Color = RGB(255, 255, 255) ' White font
    End With

    ' Auto-fit all columns
    ws.Columns.AutoFit

    ' Add borders to used range
    ws.UsedRange.Borders.LineStyle = xlContinuous

    ' Format currency for columns D and E (assuming these are price-related)
    ws.Columns("D:E").NumberFormat = "$#,##0.00"

    ' Center align data in column C
    ws.Columns("C").HorizontalAlignment = xlCenter

    MsgBox "Formatting Complete!"
End Sub