from django.shortcuts import render
from django.http import HttpResponse

def sample_view(request):
    """
    A Django view that renders a template
    """
    context = {
        'title': 'Sample Page',
        'content': 'This is a sample page rendered by a Django view.',
        'items': ['Item 1', 'Item 2', 'Item 3']
    }
    
    # Render the template with context
    return render(request, 'sample_template.html', context)

# Alternative view example with more functionality
def another_view(request):
    """
    Another example Django view with conditional logic
    """
    import datetime
    
    context = {
        'current_time': datetime.datetime.now(),
        'page_title': 'Current Time Page'
    }
    
    return render(request, 'time_template.html', context)