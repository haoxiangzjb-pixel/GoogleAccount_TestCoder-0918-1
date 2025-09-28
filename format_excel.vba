' VBA Macro to format an Excel sheet
Sub FormatExcelSheet()
    ' Declare variables
    Dim ws As Worksheet
    Set ws = ActiveSheet ' You can also use Worksheets("Sheet1") to target a specific sheet

    ' Format the header row (Row 1)
    With ws.Rows(1)
        .Font.Bold = True
        .Interior.Color = RGB(51, 105, 232) ' Blue background
        .Font.Color = RGB(255, 255, 255)   ' White font
        .HorizontalAlignment = xlCenter
    End With

    ' Auto-fit all columns
    ws.Columns.AutoFit

    ' Add borders to the used range
    ws.UsedRange.Borders.LineStyle = xlContinuous

    ' Format the first column (Column A) if it contains data
    If ws.Cells(1, 1).Value <> "" Then
        ws.Columns(1).ColumnWidth = 25 ' Set a specific width
    End If

    ' Example: Format a specific range, e.g., B2:D10, as currency
    ' ws.Range("B2:D10").NumberFormat = "$#,##0.00"

    MsgBox "Excel sheet formatting complete!", vbInformation
End Sub