from django.shortcuts import render

def my_random_view(request):
    # Example context data
    context = {
        'title': 'My Random View',
        'message': 'Hello from the randomly named view!'
    }
    # Render the template 'my_template.html' with the context
    return render(request, 'my_template.html', context)
