Attribute VB_Name = "FormatExcelMacro"
Sub FormatExcelSheet()
    ' Format an Excel sheet with various formatting options
    
    ' Format headers
    With Range("A1:Z1")
        .Font.Bold = True
        .Interior.Color = RGB(79, 129, 189)
        .Font.Color = RGB(255, 255, 255)
        .HorizontalAlignment = xlCenter
    End With
    
    ' Auto-fit columns
    Columns("A:Z").AutoFit
    
    ' Format the entire table with borders
    Dim lastRow As Long
    Dim lastCol As Long
    lastRow = Cells(Rows.Count, 1).End(xlUp).Row
    lastCol = Cells(1, Columns.Count).End(xlToLeft).Column
    
    With Range(Cells(1, 1), Cells(lastRow, lastCol))
        .Borders.LineStyle = xlContinuous
        .Borders.Weight = xlThin
    End With
    
    ' Format alternate rows
    Dim i As Long
    For i = 2 To lastRow Step 2
        Rows(i).Interior.Color = RGB(242, 242, 242) ' Light gray
    Next i
    
    ' Format numbers in specific columns (assuming numeric data in columns B through E)
    Dim numCol As Long
    For numCol = 2 To 5 ' Columns B to E
        If Cells(2, numCol).Value <> "" Then
            Columns(numCol).NumberFormat = "#,##0.00"
        End If
    Next numCol
    
    MsgBox "Excel sheet formatted successfully!"
End Sub

Sub AutoFormatWorkbook()
    ' This subroutine can be called automatically when opening the workbook
    Call FormatExcelSheet
End Sub