from django.shortcuts import render
from django.http import HttpResponse


def sample_view(request):
    """
    A sample Django view that renders a template
    """
    context = {
        'title': 'Sample Page',
        'message': 'Hello from Django view!',
        'items': ['Item 1', 'Item 2', 'Item 3']
    }
    return render(request, 'sample_template.html', context)


def another_view(request):
    """
    Another example view
    """
    return HttpResponse("This is a simple response")