from django.shortcuts import render

def sample_view(request):
    """
    A simple Django view that renders a template.
    """
    context = {
        'message': 'Hello from the Django view!',
        'items': ['item1', 'item2', 'item3']
    }
    return render(request, 'sample.html', context)