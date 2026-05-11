Sub FormatExcelSheet()
    ' VBA Macro to format an Excel sheet
    ' This macro applies various formatting options to the active worksheet
    
    Dim ws As Worksheet
    Dim rng As Range
    Dim lastRow As Long
    Dim lastCol As Long
    
    ' Set the worksheet to format (active sheet)
    Set ws = ActiveSheet
    
    ' Find the last used row and column
    On Error Resume Next
    lastRow = ws.Cells.Find(What:="*", After:=ws.Range("A1"), SearchOrder:=xlByRows, SearchDirection:=xlPrevious).Row
    lastCol = ws.Cells.Find(What:="*", After:=ws.Range("A1"), SearchOrder:=xlByColumns, SearchDirection:=xlPrevious).Column
    On Error GoTo 0
    
    ' If no data found, use a default range
    If lastRow = 0 Then lastRow = 10
    If lastCol = 0 Then lastCol = 5
    
    ' Define the range to format
    Set rng = ws.Range(ws.Cells(1, 1), ws.Cells(lastRow, lastCol))
    
    ' Apply header formatting (first row)
    With ws.Range(ws.Cells(1, 1), ws.Cells(1, lastCol))
        .Font.Bold = True
        .Font.Size = 12
        .Interior.Color = RGB(200, 200, 255)
        .HorizontalAlignment = xlCenter
        .VerticalAlignment = xlCenter
        .Borders.LineStyle = xlContinuous
        .Borders.Weight = xlMedium
    End With
    
    ' Format data range
    With rng
        .Font.Name = "Calibri"
        .Font.Size = 11
        .WrapText = True
        .RowHeight = 20
    End With
    
    ' Add borders to all cells
    With rng.Borders
        .LineStyle = xlContinuous
        .Color = RGB(0, 0, 0)
        .Weight = xlThin
    End With
    
    ' Auto-fit columns
    ws.Columns.AutoFit
    
    ' Freeze the top row
    ws.Application.ActiveWindow.FreezePanes = False
    ws.Rows("2:2").Select
    ws.Application.ActiveWindow.FreezePanes = True
    
    ' Add a title if cell A1 is empty or replace with formatted title
    If ws.Range("A1").Value = "" Then
        ws.Range("A1").Value = "Formatted Report"
        ws.Range("A1").Font.Size = 14
    End If
    
    ' Message to confirm formatting
    MsgBox "Sheet formatting completed successfully!", vbInformation, "Format Complete"
    
End Sub
