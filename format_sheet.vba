Sub FormatSheet()
    '
    ' FormatSheet Macro
    ' Formats the active sheet with bold headers, borders, and auto-fit columns.
    '

    ' Format the first row as headers
    With Rows(1)
        .Font.Bold = True
        .Interior.Color = RGB(200, 200, 200) ' Light grey background
    End With

    ' Add borders to the used range
    With ActiveSheet.UsedRange
        .Borders.LineStyle = xlContinuous
        .Borders.Weight = xlThin
    End With

    ' Auto-fit column widths
    Columns.AutoFit

End Sub