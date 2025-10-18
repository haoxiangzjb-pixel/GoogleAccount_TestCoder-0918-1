from django.shortcuts import render
from django.http import HttpResponse

def my_template_view(request):
    """
    A Django view that renders a template
    """
    context = {
        'title': 'My Page',
        'message': 'Hello from the Django view!',
        'items': ['Item 1', 'Item 2', 'Item 3']
    }
    
    return render(request, 'my_template.html', context)

# Alternative view example
def simple_view(request):
    """
    A simple Django view that renders a basic template
    """
    return render(request, 'base.html', {'content': 'This is a simple view'})