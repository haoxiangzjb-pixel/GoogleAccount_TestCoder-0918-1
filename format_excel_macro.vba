' VBA Macro to format an Excel sheet
Sub FormatExcelSheet()
    ' Declare variables
    Dim ws As Worksheet
    Set ws = ActiveSheet
    
    ' Format headers (Row 1)
    With ws.Rows(1)
        .Font.Bold = True
        .Interior.Color = RGB(68, 114, 196) ' Blue background
        .Font.Color = RGB(255, 255, 255) ' White text
        .HorizontalAlignment = xlCenter
    End With
    
    ' Auto-fit column widths
    ws.Columns.AutoFit
    
    ' Format alternate rows
    Dim i As Integer
    For i = 2 To ws.UsedRange.Rows.Count
        If i Mod 2 = 0 Then
            ws.Rows(i).Interior.Color = RGB(242, 242, 242) ' Light gray for even rows
        End If
    Next i
    
    ' Add borders to the used range
    With ws.UsedRange.Borders
        .LineStyle = xlContinuous
        .Weight = xlThin
        .ColorIndex = 1 ' Black
    End With
    
    ' Format numbers in columns that contain numbers
    Dim rng As Range
    For Each rng In ws.UsedRange.Columns
        If IsNumeric(Application.WorksheetFunction.Sum(rng)) Then
            rng.NumberFormat = "#,##0.00"
        End If
    Next rng
    
    MsgBox "Excel sheet formatting completed successfully!"
End Sub

' Optional: Auto-run the formatting when the workbook opens
Private Sub Workbook_Open()
    FormatExcelSheet
End Sub