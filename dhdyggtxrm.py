from django.shortcuts import render
from django.http import HttpResponse

def my_template_view(request):
    """
    A Django view that renders a template
    """
    context = {
        'title': 'My Django Page',
        'content': 'Hello, this is rendered from a Django template!'
    }
    return render(request, 'my_template.html', context)

def another_view(request):
    """
    Another simple view that returns a basic HttpResponse
    """
    return HttpResponse("This is a simple response without a template.")