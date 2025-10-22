from django.shortcuts import render
from django.http import HttpResponse

def sample_view(request):
    """
    A Django view that renders a template.
    """
    context = {
        'title': 'Welcome to My Site',
        'message': 'This is a sample Django view rendering a template.',
        'items': ['Item 1', 'Item 2', 'Item 3']
    }
    return render(request, 'sample_template.html', context)

# Alternative view example with more functionality
def another_view(request):
    """
    Another example of a Django view with more complex logic.
    """
    # You can add more complex logic here
    import datetime
    current_time = datetime.datetime.now()
    
    context = {
        'current_time': current_time,
        'page_title': 'Dynamic Page',
        'user_authenticated': request.user.is_authenticated if hasattr(request, 'user') else False
    }
    
    return render(request, 'another_template.html', context)