Sub FormatExcelSheet()
    ' VBA Macro to format an Excel sheet
    
    Dim ws As Worksheet
    Dim rng As Range
    Dim lastRow As Long
    Dim lastCol As Long
    
    ' Set the worksheet to format (active sheet)
    Set ws = ActiveSheet
    
    ' Find the last used row and column
    lastRow = ws.Cells(ws.Rows.Count, 1).End(xlUp).Row
    lastCol = ws.Cells(1, ws.Columns.Count).End(xlToLeft).Column
    
    ' Define the range to format
    Set rng = ws.Range(ws.Cells(1, 1), ws.Cells(lastRow, lastCol))
    
    ' Format header row (first row)
    With ws.Rows(1)
        .Font.Bold = True
        .Font.Size = 12
        .Interior.Color = RGB(200, 200, 255) ' Light blue background
        .HorizontalAlignment = xlCenter
        .VerticalAlignment = xlCenter
    End With
    
    ' Format the entire data range
    With rng
        .Font.Name = "Calibri"
        .Font.Size = 11
        .Borders.LineStyle = xlContinuous
        .Borders.Color = RGB(0, 0, 0)
        .ColumnWidth = 15
    End With
    
    ' AutoFit columns for better readability
    ws.Columns.AutoFit
    
    ' Add alternating row colors for better readability
    Dim i As Long
    For i = 2 To lastRow Step 2
        ws.Rows(i).Interior.Color = RGB(240, 240, 240) ' Light gray
    Next i
    
    ' Freeze the top row
    ws.Activate
    ws.Range("A2").Select
    ActiveWindow.FreezePanes = True
    
    ' Add a title if cell A1 is empty
    If ws.Range("A1").Value = "" Then
        ws.Range("A1").Value = "Formatted Data"
    End If
    
    MsgBox "Sheet formatting completed successfully!", vbInformation, "Format Complete"
    
End Sub
