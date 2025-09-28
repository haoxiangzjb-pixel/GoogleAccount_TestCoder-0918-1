Attribute VB_Name = "FormatExcelMacro"
Sub FormatExcelSheet()
    '
    ' FormatExcelSheet Macro
    ' This macro formats the active Excel sheet with a title, headers, and basic styling.
    '

    ' Define the last row and column with data
    Dim lastRow As Long
    Dim lastCol As Long
    lastRow = Cells(Rows.Count, 1).End(xlUp).Row
    lastCol = Cells(1, Columns.Count).End(xlToLeft).Column

    ' Clear any existing formatting on the data range
    Cells.ClearFormats

    ' Format the header row (Row 1)
    With Rows(1)
        .Font.Bold = True
        .Interior.Color = RGB(79, 129, 189) ' Blue background
        .Font.Color = RGB(255, 255, 255)   ' White font
        .HorizontalAlignment = xlCenter
    End With

    ' Format the title cell (A1) if it contains a title
    With Range("A1")
        If .Value <> "" Then
            .Font.Size = 14
            .Font.Bold = True
        End If
    End With

    ' Auto-fit columns to data
    Columns(1).Resize(, lastCol).AutoFit

    ' Add borders to the data range
    With Range(Cells(1, 1), Cells(lastRow, lastCol))
        .Borders.LineStyle = xlContinuous
        .Borders.Weight = xlThin
    End With

    ' Center the data in cells (excluding the header row)
    With Range(Cells(2, 1), Cells(lastRow, lastCol))
        .HorizontalAlignment = xlCenter
    End With

    MsgBox "Excel sheet formatting complete!", vbInformation, "Macro Complete"

End Sub