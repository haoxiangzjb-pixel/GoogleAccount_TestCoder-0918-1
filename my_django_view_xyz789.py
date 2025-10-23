from django.shortcuts import render
from django.http import HttpResponse

def homepage_view(request):
    """
    A Django view that renders a homepage template.
    """
    context = {
        'page_title': 'Homepage',
        'welcome_message': 'Welcome to our website!',
        'features': [
            {'name': 'Fast', 'description': 'Our service is very fast'},
            {'name': 'Reliable', 'description': 'We provide reliable service'},
            {'name': 'Secure', 'description': 'Your data is secure with us'}
        ]
    }
    
    # Render the homepage template with context
    return render(request, 'homepage.html', context)

def about_view(request):
    """
    A Django view that renders an about page template.
    """
    context = {
        'page_title': 'About Us',
        'about_content': 'Learn more about our company and mission',
        'team_members': ['Alice', 'Bob', 'Charlie']
    }
    
    return render(request, 'about.html', context)