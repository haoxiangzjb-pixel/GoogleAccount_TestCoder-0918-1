Sub FormatReportSheet()
    '
    ' FormatReportSheet Macro
    ' This macro formats the active sheet for a professional report.
    '

    ' Define the range for the header row (assuming row 1)
    Dim HeaderRange As Range
    Set HeaderRange = Range("1:1")

    ' Format the header row
    With HeaderRange
        .Font.Bold = True
        .Font.Color = RGB(255, 255, 255) ' White font
        .Interior.Color = RGB(0, 100, 150) ' Blue background
        .HorizontalAlignment = xlCenter
        .VerticalAlignment = xlCenter
    End With

    ' Auto-fit all columns
    Columns.AutoFit

    ' Add borders to the used range
    Dim UsedRange As Range
    Set UsedRange = ActiveSheet.UsedRange
    With UsedRange.Borders
        .LineStyle = xlContinuous
        .Weight = xlThin
        .ColorIndex = xlAutomatic
    End With

    ' Format any numbers in the range as Currency (optional, example for column B)
    ' Uncomment the following lines if you want to format a specific column as currency
    ' Dim CurrencyColumn As Range
    ' Set CurrencyColumn = Columns("B:B") ' Change "B:B" to your desired column
    ' CurrencyColumn.NumberFormat = "$#,##0.00"

End Sub