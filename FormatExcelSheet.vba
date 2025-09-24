Sub FormatExcelSheet()
    '
    ' FormatExcelSheet Macro
    ' This macro formats the active Excel sheet by applying bold headers, borders, and auto-fitting columns.
    '

    ' Apply bold formatting to the first row (headers)
    Rows("1:1").Select
    Selection.Font.Bold = True

    ' Select the used range of the sheet
    ActiveSheet.UsedRange.Select

    ' Apply borders to the selected range
    With Selection.Borders
        .LineStyle = xlContinuous
        .ColorIndex = xlAutomatic
        .TintAndShade = 0
        .Weight = xlThin
    End With

    ' Auto-fit the column widths
    Columns("A:Z").AutoFit

    ' Optional: Add a title in cell A1 and merge it across the header row
    ' Adjust the number of columns as needed
    ' Range("A1:C1").Select
    ' Application.CutCopyMode = False
    ' With Selection
    '     .Merge
    '     .HorizontalAlignment = xlCenter
    '     .VerticalAlignment = xlBottom
    '     .WrapText = False
    '     .Orientation = 0
    '     .AddIndent = False
    '     .IndentLevel = 0
    '     .ShrinkToFit = False
    '     .ReadingOrder = xlContext
    '     .MergeCells = True
    ' End With
    ' Selection.Value = "Formatted Report"
    ' Selection.Font.Bold = True

End Sub