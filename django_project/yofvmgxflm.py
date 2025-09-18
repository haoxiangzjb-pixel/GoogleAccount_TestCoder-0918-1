
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
