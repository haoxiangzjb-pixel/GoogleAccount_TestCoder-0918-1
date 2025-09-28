Attribute VB_Name = "FormatSheet"
Sub FormatExcelSheet()
    '
    ' FormatExcelSheet Macro
    ' This macro formats the active Excel sheet by auto-fitting columns,
    ' applying bold headers, and adding borders.
    '

    ' Auto-fit all columns
    Cells.EntireColumn.AutoFit

    ' Format the header row (Row 1)
    With Rows(1)
        .Font.Bold = True
        .Interior.Color = RGB(200, 200, 200) ' Light grey background
    End With

    ' Add borders to the used range
    With ActiveSheet.UsedRange.Borders
        .LineStyle = xlContinuous
        .Weight = xlThin
    End With

    ' Example: Format the first column as Date if it contains dates (optional)
    ' Uncomment the following lines if needed
    ' Columns(1).NumberFormat = "mm/dd/yyyy"
    
    MsgBox "Excel sheet formatted successfully!"
End Sub