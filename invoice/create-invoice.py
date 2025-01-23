import pandas as pd
from reportlab.lib.pagesizes import letter
from reportlab.pdfgen import canvas
from reportlab.lib import colors

def create_invoice(data, filename):
    c = canvas.Canvas(filename, pagesize=letter)
    width, height = letter

    # Define invoice details
    invoice_number = "00001"
    today_date = "2024-11-04"
    client_name = "QScint"
    from_company = "Brian Henkel"
    payment_terms = "Net 30"
    due_date = "2024-12-04"
    hourly_rate = 150  # Rate per hour
    total_hours = data['Hours'].sum()
    total_amount_due = total_hours * hourly_rate

    # Title and Invoice Details on the first page
    c.setFont("Helvetica-Bold", 16)
    c.drawCentredString(width / 2.0, height - 100, "Invoice")
    
    c.setFont("Helvetica", 12)
    details = [
        f"Invoice Number: {invoice_number}",
        f"Date: {today_date}",
        f"To: {client_name}",
        f"From: {from_company}",
        #f"Payment Terms: {payment_terms}",
        f"Due Date: {due_date}",
        f"Total Hours: {total_hours:.2f} hours",
        f"Total Amount Due: ${total_amount_due:.2f}"
    ]
    
    for i, detail in enumerate(details):
        c.drawString(100, height - 140 - (i * 20), detail)

    # Add a second page for detailed hours
    c.showPage()
    
    # Table headers
    c.setFont("Helvetica-Bold", 12)
    headers = ["Date", "Time Start", "Time End", "Hours", "Notes"]
    x_positions = [50, 150, 250, 320, 400]
    y_position = height - 100
    for x_pos, header in zip(x_positions, headers):
        c.drawString(x_pos, y_position, header)

    # Table rows
    c.setFont("Helvetica", 10)
    for index, row in data.iterrows():
        y_position -= 20
        for x_pos, key in zip(x_positions, headers):
            c.drawString(x_pos, y_position, str(row[key]))
    
    c.save()

# Load data from CSV
data = pd.read_csv("hours_worked.csv", parse_dates=['Date'])
data['Hours'] = data['Hours'].astype(float)  # Ensure the Hours column is treated as numeric

# Generate PDF
create_invoice(data, "invoice.pdf")
