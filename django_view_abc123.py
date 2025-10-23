from django.shortcuts import render
from django.http import HttpResponse

def sample_view(request):
    """
    A sample Django view that renders a template.
    """
    context = {
        'title': 'Sample Page',
        'message': 'Welcome to our Django application!',
        'items': ['Item 1', 'Item 2', 'Item 3']
    }
    
    # Render the template with context
    return render(request, 'sample_template.html', context)

# Alternative view example with conditional logic
def conditional_view(request):
    """
    A Django view with conditional rendering logic.
    """
    import random
    
    context = {
        'random_number': random.randint(1, 100),
        'title': 'Random Data Page'
    }
    
    if request.method == 'POST':
        context['message'] = 'This is a POST request'
    else:
        context['message'] = 'This is a GET request'
    
    return render(request, 'conditional_template.html', context)