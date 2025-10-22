' VBA Macro to format an Excel sheet
Sub FormatExcelSheet()
    ' Declare variables
    Dim ws As Worksheet
    Dim lastRow As Long
    Dim lastCol As Long
    
    ' Set the active worksheet
    Set ws = ActiveSheet
    
    ' Auto-fit all columns
    ws.Columns.AutoFit
    
    ' Format the header row (row 1)
    With ws.Rows(1)
        .Font.Bold = True
        .Interior.Color = RGB(51, 102, 204) ' Blue background
        .Font.Color = RGB(255, 255, 255) ' White text
        .HorizontalAlignment = xlCenter
    End With
    
    ' Format the entire data range with borders
    lastRow = ws.Cells(ws.Rows.Count, 1).End(xlUp).Row
    lastCol = ws.Cells(1, ws.Columns.Count).End(xlToLeft).Column
    
    With ws.Range(ws.Cells(1, 1), ws.Cells(lastRow, lastCol)).Borders
        .LineStyle = xlContinuous
        .Weight = xlThin
        .ColorIndex = 1 ' Black color
    End With
    
    ' Format numeric columns with thousand separators
    Dim cell As Range
    For Each cell In ws.UsedRange
        If IsNumeric(cell.Value) And cell.Value <> "" And cell.Row > 1 Then
            If InStr(cell.Value, ".") > 0 Then
                cell.NumberFormat = "#,##0.00"
            Else
                cell.NumberFormat = "#,##0"
            End If
        End If
    Next cell
    
    ' Adjust row height
    ws.Rows.RowHeight = 15
    
    ' Add a title to the sheet if the first cell is empty
    If ws.Cells(1, 1).Value = "" Then
        ws.Cells(1, 1).Value = "Formatted Data"
    End If
    
    MsgBox "Excel sheet has been formatted successfully!", vbInformation
End Sub