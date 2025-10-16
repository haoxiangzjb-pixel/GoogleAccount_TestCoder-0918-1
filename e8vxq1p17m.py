from django.shortcuts import render
from django.http import HttpResponse

def my_template_view(request):
    """
    A Django view that renders a template.
    """
    # Context data to pass to the template
    context = {
        'title': 'My Page',
        'message': 'Welcome to my Django application!',
        'items': ['Item 1', 'Item 2', 'Item 3']
    }
    
    # Render the template with context
    return render(request, 'my_template.html', context)

# Alternative example with a more complex view
def detail_view(request, item_id):
    """
    A Django view that renders a template with dynamic data.
    """
    # Simulate fetching data based on item_id
    item_data = {
        'id': item_id,
        'name': f'Item {item_id}',
        'description': f'Description for item {item_id}'
    }
    
    context = {
        'item': item_data,
        'title': f'Item {item_id} Details'
    }
    
    return render(request, 'item_detail.html', context)