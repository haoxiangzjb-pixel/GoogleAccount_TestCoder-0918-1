from django.shortcuts import render
from django.http import HttpResponse

def template_view(request):
    """
    A Django view that renders a template
    """
    context = {
        'title': 'My Django App',
        'message': 'Hello from the Django view!'
    }
    return render(request, 'my_template.html', context)

def simple_view(request):
    """
    A simple Django view that returns an HttpResponse
    """
    return HttpResponse("This is a simple Django view response.")