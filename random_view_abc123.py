from django.shortcuts import render

def my_template_view(request):
    """
    A simple view that renders a template.
    """
    context = {'message': 'Hello from the view!'}
    return render(request, 'my_template.html', context)
