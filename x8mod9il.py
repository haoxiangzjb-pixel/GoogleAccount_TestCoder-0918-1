from django.shortcuts import render

def my_view(request):
    """
    A Django view that renders a template.
    """
    context = {
        'title': 'My Django View',
        'message': 'Hello from the Django view!'
    }
    return render(request, 'my_template.html', context)