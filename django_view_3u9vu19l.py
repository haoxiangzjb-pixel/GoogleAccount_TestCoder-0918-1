from django.shortcuts import render
from django.http import HttpResponse


def sample_view(request):
    """
    A sample Django view that renders a template.
    """
    context = {
        'title': 'Sample Page',
        'content': 'This is a sample page rendered by a Django view.',
        'items': ['Item 1', 'Item 2', 'Item 3']
    }
    
    # Render the template with the context
    return render(request, 'sample_template.html', context)


def another_view(request):
    """
    Another example view that could be used in your Django application.
    """
    context = {
        'page_title': 'Another Page',
        'message': 'Welcome to another page!'
    }
    
    return render(request, 'another_template.html', context)