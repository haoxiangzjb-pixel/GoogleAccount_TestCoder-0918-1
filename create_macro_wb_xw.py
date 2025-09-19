import xlwings as xw
import uuid
import os

# Ensure Excel is installed and available (this might not work in all environments)
try:
    # Start a new Excel application
    app = xw.App(visible=False)

    # Add a new workbook
    wb = app.books.add()

    # Add sample data to the active sheet
    ws = wb.sheets.active
    ws.name = "Sample Data"

    headers = ["Name", "Age", "City", "Occupation", "Salary"]
    ws.range("A1").value = headers

    sample_data = [
        ["Alice", 30, "New York", "Engineer", 70000],
        ["Bob", 25, "Los Angeles", "Designer", 60000],
        ["Charlie", 35, "Chicago", "Manager", 80000],
        ["David", 28, "Houston", "Analyst", 65000],
        ["Eve", 32, "Phoenix", "Developer", 72000]
    ]

    ws.range("A2").value = sample_data

    # Add the VBA module
    module_code = '''
Sub FormatSheet()

    Dim ws As Worksheet
    Set ws = ActiveSheet

    ' Format the header row
    With ws.Range("A1:E1")
        .Font.Bold = True
        .Font.Size = 12
        .Interior.Color = RGB(200, 200, 200)
        .Borders(xlEdgeBottom).LineStyle = xlContinuous
    End With

    ' Auto-fit columns
    ws.Columns("A:E").AutoFit

    ' Format data rows
    Dim lastRow As Long
    lastRow = ws.Cells(ws.Rows.Count, "A").End(xlUp).Row

    Dim i As Long
    For i = 2 To lastRow
        If i Mod 2 = 0 Then
            ws.Rows(i).Interior.Color = RGB(240, 240, 240) ' Light grey for even rows
        Else
            ws.Rows(i).Interior.Color = RGB(255, 255, 255) ' White for odd rows
        End If
    Next i

    ' Add a border around the entire data range
    ws.Range("A1:E" & lastRow).Borders.LineStyle = xlContinuous

    MsgBox "Sheet formatting complete!"

End Sub
'''

    # Insert the VBA code into a new module named "Module1"
    wb.api.VBProject.VBComponents.Add(1).CodeModule.AddFromString(module_code)

    # Generate a random filename
    random_filename = f"macro_workbook_{uuid.uuid4().hex}.xlsm"

    # Save the workbook as a macro-enabled file
    wb.save(random_filename)

    # Close the workbook and quit the Excel application
    wb.close()
    app.quit()

    print(f"Macro-enabled workbook saved as: {random_filename}")

except Exception as e:
    print(f"An error occurred: {e}")
    # If Excel is not available or an error occurs, create a simple .bas file as a fallback
    print("Falling back to creating a .bas file...")
    fallback_filename = f"macro_{uuid.uuid4().hex}.bas"
    with open("/workspace/format_sheet_macro.bas", 'r') as f:
        macro_code = f.read()
    with open(fallback_filename, 'w') as f:
        f.write(macro_code)
    print(f"VBA macro code saved as: {fallback_filename}")