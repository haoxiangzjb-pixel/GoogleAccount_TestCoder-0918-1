' VBA Macro to format an Excel sheet
Sub FormatExcelSheet()
    ' Declare variables
    Dim ws As Worksheet
    Set ws = ActiveSheet
    
    ' Format headers (row 1)
    With ws.Rows(1)
        .Font.Bold = True
        .Interior.Color = RGB(68, 114, 196) ' Blue background
        .Font.Color = RGB(255, 255, 255) ' White text
        .HorizontalAlignment = xlCenter
    End With
    
    ' Auto-fit column widths
    ws.Columns.AutoFit
    
    ' Format alternate rows
    Dim lastRow As Long
    Dim lastCol As Long
    lastRow = ws.Cells(ws.Rows.Count, 1).End(xlUp).Row
    lastCol = ws.Cells(1, ws.Columns.Count).End(xlToLeft).Column
    
    Dim i As Long
    For i = 2 To lastRow
        If i Mod 2 = 0 Then
            ws.Rows(i).Interior.Color = RGB(242, 242, 242) ' Light gray for even rows
        End If
    Next i
    
    ' Add borders to the data range
    ws.Range(ws.Cells(1, 1), ws.Cells(lastRow, lastCol)).Borders.LineStyle = xlContinuous
    
    ' Format the first column as an example
    ws.Columns(1).HorizontalAlignment = xlLeft
    
    MsgBox "Excel sheet formatting completed successfully!", vbInformation
End Sub