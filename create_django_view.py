import random
import string

# Generate a random filename
def generate_random_filename():
    letters = string.ascii_lowercase
    random_string = ''.join(random.choice(letters) for i in range(10))
    return f"{random_string}.py"

# Django view code
view_code = '''
from django.shortcuts import render
from django.http import HttpResponse

def my_template_view(request):
    """
    A Django view that renders a template
    """
    # Context data to pass to the template
    context = {
        'title': 'My Django Page',
        'message': 'Hello from Django!',
        'items': ['apple', 'banana', 'orange']
    }
    
    # Render the template with context
    return render(request, 'my_template.html', context)

def another_view(request):
    """
    Another example view that renders a different template
    """
    context = {
        'user': {
            'name': 'John Doe',
            'email': 'john@example.com'
        },
        'posts': [
            {'title': 'First Post', 'content': 'This is the first post'},
            {'title': 'Second Post', 'content': 'This is the second post'}
        ]
    }
    
    return render(request, 'another_template.html', context)
'''

# Generate random filename
filename = generate_random_filename()
filepath = f"/workspace/django_project/{filename}"

# Write the view code to the file
with open(filepath, 'w') as f:
    f.write(view_code)

print(f"Django view saved to {filepath}")