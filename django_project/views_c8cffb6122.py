from django.shortcuts import render
from django.http import HttpResponse

def home_view(request):
    """
    A simple view that renders a template
    """
    context = {
        'title': 'Welcome to My Django App',
        'message': 'This is a sample view rendering a template'
    }
    return render(request, 'home.html', context)

def about_view(request):
    """
    Another view example
    """
    return render(request, 'about.html', {
        'team_members': ['Alice', 'Bob', 'Charlie']
    })

def contact_view(request):
    """
    View with form handling
    """
    if request.method == 'POST':
        # Process form data
        name = request.POST.get('name')
        email = request.POST.get('email')
        # In a real app, you would validate and process this data
        return render(request, 'thank_you.html', {'name': name})
    
    # If not POST, render the contact form
    return render(request, 'contact.html')