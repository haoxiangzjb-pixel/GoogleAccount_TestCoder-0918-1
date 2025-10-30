from django.shortcuts import render
from django.http import HttpResponse
from django.template import loader


def index_view(request):
    """
    A Django view that renders a template with dynamic content.
    """
    template = loader.get_template('index.html')
    context = {
        'site_name': 'My Django Site',
        'current_year': 2023,
        'features': [
            'User Authentication',
            'Data Management',
            'Responsive Design'
        ]
    }
    return HttpResponse(template.render(context, request))


def about_view(request):
    """
    Another Django view rendering an about page.
    """
    context = {
        'about_title': 'About Us',
        'description': 'This is an example Django application.',
        'team_members': ['Alice', 'Bob', 'Charlie']
    }
    return render(request, 'about.html', context)