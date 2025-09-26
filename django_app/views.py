from django.shortcuts import render

def example_view(request):
    context = {
        'message': 'Hello from the Django view!',
        'items': ['Item 1', 'Item 2', 'Item 3']
    }
    return render(request, 'example_template.html', context)
