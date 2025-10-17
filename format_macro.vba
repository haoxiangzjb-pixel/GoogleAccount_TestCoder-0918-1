' VBA Macro to format an Excel sheet
Sub FormatExcelSheet()
    ' Declare variables
    Dim ws As Worksheet
    Set ws = ActiveSheet
    
    ' Format headers (row 1)
    With ws.Rows(1)
        .Font.Bold = True
        .Interior.Color = RGB(51, 102, 255) ' Blue background
        .Font.Color = RGB(255, 255, 255) ' White text
        .HorizontalAlignment = xlCenter
    End With
    
    ' Auto-fit all columns
    ws.Columns.AutoFit
    
    ' Add borders to used range
    With ws.UsedRange.Borders
        .LineStyle = xlContinuous
        .Weight = xlThin
        .ColorIndex = 1 ' Black
    End With
    
    ' Format date columns (if any) - assuming dates might be in columns with "date" in header
    Dim cell As Range
    For Each cell In ws.Rows(1).UsedRange
        If InStr(LCase(cell.Value), "date") > 0 Then
            ws.Columns(cell.Column).NumberFormat = "mm/dd/yyyy"
        End If
    Next cell
    
    ' Format number columns (if any) - assuming numbers might be in columns with "amount", "price", "cost", "value" in header
    For Each cell In ws.Rows(1).UsedRange
        If InStr(LCase(cell.Value), "amount") > 0 Or _
           InStr(LCase(cell.Value), "price") > 0 Or _
           InStr(LCase(cell.Value), "cost") > 0 Or _
           InStr(LCase(cell.Value), "value") > 0 Then
            ws.Columns(cell.Column).NumberFormat = "#,##0.00"
        End If
    Next cell
    
    ' Apply alternating row colors for better readability
    Dim i As Long
    For i = 2 To ws.UsedRange.Rows.Count
        If i Mod 2 = 0 Then
            ws.Rows(i).Interior.Color = RGB(240, 240, 240) ' Light gray
        End If
    Next i
    
    MsgBox "Excel sheet formatting completed!", vbInformation
End Sub