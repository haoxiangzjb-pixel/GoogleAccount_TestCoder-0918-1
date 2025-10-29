Sub FormatExcelSheet()
    ' Format an Excel sheet with various formatting options
    
    Dim ws As Worksheet
    Set ws = ActiveSheet
    
    ' Format headers (row 1)
    With ws.Rows(1)
        .Font.Bold = True
        .Interior.Color = RGB(68, 114, 196) ' Blue background
        .Font.Color = RGB(255, 255, 255) ' White text
        .HorizontalAlignment = xlCenter
    End With
    
    ' Auto-fit all columns
    ws.Columns.AutoFit
    
    ' Format alternate rows
    Dim i As Long
    For i = 2 To ws.UsedRange.Rows.Count Step 2
        ws.Rows(i).Interior.Color = RGB(242, 242, 242) ' Light gray
    Next i
    
    ' Add borders to the used range
    With ws.UsedRange.Borders
        .LineStyle = xlContinuous
        .Weight = xlThin
    End With
    
    ' Format date columns (if any) - assuming dates might be in columns with "date" in header
    Dim col As Long
    For col = 1 To ws.UsedRange.Columns.Count
        If InStr(LCase(CStr(ws.Cells(1, col).Value)), "date") > 0 Then
            ws.Columns(col).NumberFormat = "mm/dd/yyyy"
        End If
    Next col
    
    ' Adjust row height
    ws.Rows.RowHeight = 15
    
    MsgBox "Excel sheet formatting completed!", vbInformation
End Sub