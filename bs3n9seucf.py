from django.shortcuts import render
from django.http import HttpResponse

def sample_template_view(request):
    """
    A Django view that renders a template.
    """
    context = {
        'title': 'Sample Page',
        'message': 'Welcome to the sample page!',
        'items': ['Item 1', 'Item 2', 'Item 3']
    }
    return render(request, 'sample_template.html', context)

# Alternative view example
def another_template_view(request):
    """
    Another example of a Django view that renders a template.
    """
    context = {
        'page_title': 'My Page',
        'content': 'This is the content of the page.'
    }
    return render(request, 'another_template.html', context)