#!/usr/bin/env python3
"""
Form Processing Script
Handles form submission with validation and sanitization
"""
import os
import json
import re
import secrets
from datetime import datetime
from http.server import HTTPServer, BaseHTTPRequestHandler
from urllib.parse import parse_qs
from io import StringIO


def sanitize_input(data):
    """Sanitize input data by removing extra whitespace"""
    if data:
        return data.strip()
    return ""


def validate_email(email):
    """Validate email format using regex"""
    pattern = r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$'
    return re.match(pattern, email) is not None


def validate_required(field, field_name):
    """Validate required fields"""
    if not field or field.strip() == "":
        return f"{field_name} is required."
    return None


class FormHandler(BaseHTTPRequestHandler):
    def do_GET(self):
        """Serve the form HTML"""
        self.send_response(200)
        self.send_header('Content-type', 'text/html')
        self.end_headers()
        
        # Generate a random filename
        random_filename = f'form_handler_{secrets.token_hex(8)}.py'
        
        html_content = f'''
        <!DOCTYPE html>
        <html>
        <head>
            <title>Form Handler</title>
        </head>
        <body>
            <h2>Form Processing Script</h2>
            <p>Script saved with random filename: <strong>{random_filename}</strong></p>
            
            <form method="post" action="/">
                <div>
                    <label for="name">Name:</label><br>
                    <input type="text" id="name" name="name" required>
                </div>
                <div>
                    <label for="email">Email:</label><br>
                    <input type="email" id="email" name="email" required>
                </div>
                <div>
                    <label for="message">Message:</label><br>
                    <textarea id="message" name="message" required></textarea>
                </div>
                <div>
                    <input type="submit" value="Submit">
                </div>
            </form>
        </body>
        </html>
        '''
        
        self.wfile.write(html_content.encode('utf-8'))
    
    def do_POST(self):
        """Process form submission"""
        content_length = int(self.headers['Content-Length'])
        post_data = self.rfile.read(content_length).decode('utf-8')
        form_data = parse_qs(post_data)
        
        # Extract form values
        name = sanitize_input(form_data.get('name', [''])[0])
        email = sanitize_input(form_data.get('email', [''])[0])
        message = sanitize_input(form_data.get('message', [''])[0])
        
        # Validate form data
        errors = []
        name_error = validate_required(name, "Name")
        if name_error:
            errors.append(name_error)
        
        email_error = validate_required(email, "Email")
        if email_error:
            errors.append(email_error)
        elif not validate_email(email):
            errors.append("Invalid email format.")
        
        message_error = validate_required(message, "Message")
        if message_error:
            errors.append(message_error)
        
        # Prepare response
        if not errors:
            # Save to file
            data = {
                'name': name,
                'email': email,
                'message': message,
                'timestamp': datetime.now().strftime('%Y-%m-%d %H:%M:%S')
            }
            
            with open('form_submissions.txt', 'a') as f:
                f.write(json.dumps(data) + '\n')
            
            response_html = '''
            <!DOCTYPE html>
            <html>
            <head>
                <title>Success</title>
            </head>
            <body>
                <h2>Form Processing Script</h2>
                <p>Script saved with random filename: <strong>form_handler_{random_filename}</strong></p>
                <div style="color: green;">Form submitted successfully!</div>
                <a href="/">Back to form</a>
            </body>
            </html>
            '''.format(random_filename=secrets.token_hex(8))
        else:
            # Generate error response
            errors_html = ''.join([f'<p>{error}</p>' for error in errors])
            response_html = f'''
            <!DOCTYPE html>
            <html>
            <head>
                <title>Form Errors</title>
            </head>
            <body>
                <h2>Form Processing Script</h2>
                <p>Script saved with random filename: <strong>form_handler_{secrets.token_hex(8)}</strong></p>
                <div style="color: red;">{errors_html}</div>
                <a href="/">Back to form</a>
            </body>
            </html>
            '''
        
        self.send_response(200)
        self.send_header('Content-type', 'text/html')
        self.end_headers()
        self.wfile.write(response_html.encode('utf-8'))


def save_script_with_random_name():
    """Save this script with a random filename"""
    with open(__file__, 'r') as f:
        script_content = f.read()
    
    # Generate a random filename
    random_filename = f'form_handler_{secrets.token_hex(8)}.py'
    
    # Write the script to the new file
    with open(random_filename, 'w') as f:
        f.write(script_content)
    
    print(f"Script saved with random filename: {random_filename}")
    return random_filename


if __name__ == "__main__":
    # Save the script with a random filename
    random_file = save_script_with_random_name()
    
    print("Starting server on port 8000...")
    print(f"Visit http://localhost:8000 to access the form")
    print(f"Press Ctrl+C to stop the server")
    
    # Start the server
    server = HTTPServer(('localhost', 8000), FormHandler)
    try:
        server.serve_forever()
    except KeyboardInterrupt:
        print("\nServer stopped.")
        server.server_close()