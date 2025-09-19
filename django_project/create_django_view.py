import secrets
import string

# Generate a random file name
alphabet = string.ascii_lowercase + string.digits
random_filename = ''.join(secrets.choice(alphabet) for _ in range(10)) + '.py'

# Django view code
view_code = '''from django.shortcuts import render
from django.http import HttpResponse

def my_template_view(request):
    # Sample context data
    context = {
        'title': 'My Django Page',
        'message': 'Hello from Django!',
        'items': ['item1', 'item2', 'item3']
    }
    return render(request, 'my_template.html', context)
'''

# Write the view code to the random file
with open(random_filename, 'w') as f:
    f.write(view_code)

print(f"Django view saved to {random_filename}")