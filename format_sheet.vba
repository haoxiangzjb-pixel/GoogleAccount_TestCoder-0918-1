Attribute VB_Name = "format_sheet"
Sub FormatSheet()
    '
    ' FormatSheet Macro
    ' Formats the active sheet with a title, headers, and basic styling.
    '

    ' Set the title in cell A1
    Range("A1").Value = "Monthly Sales Report"
    Range("A1").Font.Bold = True
    Range("A1").Font.Size = 16
    
    ' Set headers in row 3
    Range("A3").Value = "Product"
    Range("B3").Value = "Q1 Sales"
    Range("C3").Value = "Q2 Sales"
    Range("D3").Value = "Q3 Sales"
    Range("E3").Value = "Q4 Sales"
    
    ' Format header row
    Range("A3:E3").Font.Bold = True
    Range("A3:E3").Interior.Color = RGB(200, 200, 200)
    
    ' Auto-fit columns
    Columns("A:E").AutoFit
    
    ' Add a border to the data range
    Range("A3:E10").Borders.LineStyle = xlContinuous

End Sub