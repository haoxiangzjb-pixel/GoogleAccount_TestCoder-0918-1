from django.shortcuts import render
from django.http import HttpResponse

def sample_view(request):
    """
    A simple Django view that renders a template.
    """
    context = {
        'title': 'Sample Page',
        'content': 'This is a sample page rendered by a Django view.',
        'items': ['Item 1', 'Item 2', 'Item 3']
    }
    return render(request, 'sample_template.html', context)

# Alternative view example with more functionality
def dynamic_view(request):
    """
    A Django view with more dynamic content.
    """
    import datetime
    
    context = {
        'current_time': datetime.datetime.now(),
        'user': request.user if request.user.is_authenticated else 'Guest',
        'page_title': 'Dynamic Page'
    }
    
    return render(request, 'dynamic_template.html', context)