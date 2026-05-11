Sub FormatExcelSheet()
    ' VBA Macro to format an Excel sheet with professional styling
    
    Dim ws As Worksheet
    Dim lastRow As Long
    Dim lastCol As Long
    Dim dataRange As Range
    Dim headerRange As Range
    
    ' Set the worksheet to the active sheet
    Set ws = ActiveSheet
    
    ' Find the last used row and column
    lastRow = ws.Cells(ws.Rows.Count, 1).End(xlUp).Row
    lastCol = ws.Cells(1, ws.Columns.Count).End(xlToLeft).Column
    
    ' If no data exists, exit the subroutine
    If lastRow < 2 And lastCol < 2 Then
        MsgBox "No data found to format!", vbExclamation
        Exit Sub
    End If
    
    ' Define ranges
    Set dataRange = ws.Range(ws.Cells(1, 1), ws.Cells(lastRow, lastCol))
    Set headerRange = ws.Range(ws.Cells(1, 1), ws.Cells(1, lastCol))
    
    ' Format headers (first row)
    With headerRange
        .Font.Bold = True
        .Font.Size = 12
        .Font.Color = RGB(255, 255, 255)
        .Interior.Color = RGB(70, 130, 180) ' Steel blue background
        .HorizontalAlignment = xlCenter
        .VerticalAlignment = xlCenter
        .Borders.LineStyle = xlContinuous
        .Borders.Color = RGB(0, 0, 0)
        .Borders.Weight = xlMedium
    End With
    
    ' Format data range (excluding headers)
    With dataRange
        .Font.Name = "Calibri"
        .Font.Size = 11
        .WrapText = True
        .RowHeight = 20
        .HorizontalAlignment = xlLeft
        .VerticalAlignment = xlCenter
        .Borders.LineStyle = xlContinuous
        .Borders.Color = RGB(0, 0, 0)
        .Borders.Weight = xlThin
    End With
    
    ' Auto-fit columns
    dataRange.Columns.AutoFit
    
    ' Freeze the top row
    ws.Activate
    ws.Range("A2").Select
    ActiveWindow.FreezePanes = True
    
    ' Add a title if cell A1 doesn't contain a header
    If ws.Range("A1").Value = "" Then
        ws.Range("A1").Value = "Formatted Report"
        ws.Range("A1").Font.Bold = True
        ws.Range("A1").Font.Size = 14
    End If
    
    ' Display confirmation message
    MsgBox "Sheet formatted successfully!", vbInformation
    
End Sub
