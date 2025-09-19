from django.shortcuts import render
from django.http import HttpResponse

def my_template_view(request):
    """
    A Django view that renders a template.
    """
    context = {
        'title': 'My Django View',
        'message': 'Hello from the randomly named Django view file!',
    }
    return render(request, 'my_template.html', context)

def another_view(request):
    """
    Another example view that renders a different template.
    """
    context = {
        'items': ['apple', 'banana', 'orange'],
        'user': 'John Doe',
    }
    return render(request, 'another_template.html', context)