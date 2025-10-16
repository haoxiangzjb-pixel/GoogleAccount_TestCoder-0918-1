Attribute VB_Name = "FormatExcelSheet"
Sub FormatExcelSheet()
    ' This macro formats an Excel sheet with common formatting options
    
    Dim ws As Worksheet
    Set ws = ActiveSheet
    
    ' Format headers (first row)
    With ws.Rows(1)
        .Font.Bold = True
        .Interior.Color = RGB(79, 129, 189) ' Blue background
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
    
    ' Format date columns if any (assuming dates might be in columns with "Date" in header)
    Dim cell As Range
    For Each cell In ws.Rows(1).UsedRange
        If InStr(LCase(cell.Value), "date") > 0 Then
            ws.Columns(cell.Column).NumberFormat = "mm/dd/yyyy"
        End If
    Next cell
    
    ' Format currency columns if any (assuming currency might be in columns with "Amount", "Price", "Cost", "Total" in header)
    For Each cell In ws.Rows(1).UsedRange
        If InStr(LCase(cell.Value), "amount") > 0 Or _
           InStr(LCase(cell.Value), "price") > 0 Or _
           InStr(LCase(cell.Value), "cost") > 0 Or _
           InStr(LCase(cell.Value), "total") > 0 Then
            ' Format the entire column as currency (excluding header)
            ws.Range(ws.Cells(2, cell.Column), ws.Cells(ws.Rows.Count, cell.Column).End(xlUp)).NumberFormat = "$#,##0.00"
        End If
    Next cell
    
    MsgBox "Excel sheet formatted successfully!", vbInformation, "Format Complete"
End Sub