from django.shortcuts import render
from django.http import HttpResponse

def sample_view(request):
    """
    A Django view that renders a template.
    """
    context = {
        'title': 'Sample Page',
        'content': 'This is a sample page rendered by a Django view.',
        'items': ['Item 1', 'Item 2', 'Item 3']
    }
    return render(request, 'sample_template.html', context)

# Alternative example with a more complex view
def complex_view(request):
    """
    A more complex Django view that renders a template with dynamic data.
    """
    import datetime
    
    context = {
        'current_time': datetime.datetime.now(),
        'page_title': 'Dynamic Page',
        'user_count': 150,
        'features': [
            {'name': 'Feature 1', 'description': 'Description of feature 1'},
            {'name': 'Feature 2', 'description': 'Description of feature 2'},
            {'name': 'Feature 3', 'description': 'Description of feature 3'},
        ]
    }
    return render(request, 'complex_template.html', context)