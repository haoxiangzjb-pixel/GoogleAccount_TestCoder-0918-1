import openpyxl
from openpyxl.workbook.defined_name import DefinedName
import uuid

# Create a new workbook
wb = openpyxl.Workbook()

# Add a sample worksheet with some data for demonstration
ws = wb.active
ws.title = "Sample Data"

# Add sample data
headers = ["Name", "Age", "City", "Occupation", "Salary"]
ws.append(headers)

sample_data = [
    ["Alice", 30, "New York", "Engineer", 70000],
    ["Bob", 25, "Los Angeles", "Designer", 60000],
    ["Charlie", 35, "Chicago", "Manager", 80000],
    ["David", 28, "Houston", "Analyst", 65000],
    ["Eve", 32, "Phoenix", "Developer", 72000]
]

for row in sample_data:
    ws.append(row)

# Add VBA project
wb.vba_code = {}

# Add the VBA macro code as a new module
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

# Assign the macro to the workbook
wb.vba_code['Module1'] = module_code

# Generate a random filename
random_filename = f"macro_workbook_{uuid.uuid4().hex}.xlsm"

# Save the workbook
wb.save(random_filename)

print(f"Macro-enabled workbook saved as: {random_filename}")