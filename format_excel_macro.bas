Attribute VB_Name = "FormatExcelMacro"
Sub FormatExcelSheet()
    ' This macro formats an Excel sheet with common formatting options
    
    Dim ws As Worksheet
    Set ws = ActiveSheet
    
    ' Format headers (row 1)
    With ws.Rows(1)
        .Font.Bold = True
        .Interior.Color = RGB(51, 102, 204) ' Blue background
        .Font.Color = RGB(255, 255, 255) ' White text
        .HorizontalAlignment = xlCenter
    End With
    
    ' Auto-fit columns
    ws.Columns.AutoFit
    
    ' Format the first column as an example
    ws.Columns(1).ColumnWidth = 20
    
    ' Add borders to the used range
    With ws.UsedRange.Borders
        .LineStyle = xlContinuous
        .Weight = xlThin
        .ColorIndex = 1 ' Black
    End With
    
    ' Format date columns (if any) - assuming column C might contain dates
    On Error Resume Next
    ws.Columns("C:C").NumberFormat = "mm/dd/yyyy"
    On Error GoTo 0
    
    ' Add alternating row colors for better readability
    Dim lastRow As Long
    Dim lastCol As Long
    lastRow = ws.UsedRange.Rows.Count + ws.UsedRange.Row - 1
    lastCol = ws.UsedRange.Columns.Count + ws.UsedRange.Column - 1
    
    Dim i As Long
    For i = 2 To lastRow Step 2
        ws.Rows(i).Interior.Color = RGB(240, 240, 240) ' Light gray
    Next i
    
    MsgBox "Excel sheet has been formatted successfully!", vbInformation, "Format Complete"
End Sub