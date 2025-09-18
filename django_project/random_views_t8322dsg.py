import random
import string
from django.shortcuts import render
from django.http import HttpResponse

def generate_random_string(length=10):
    """Generate a random string of fixed length"""
    letters = string.ascii_lowercase
    return ''.join(random.choice(letters) for i in range(length))

def my_view(request):
    """A simple Django view that renders a template"""
    context = {
        'message': 'Hello, World!',
        'random_string': generate_random_string(),
    }
    return render(request, 'my_template.html', context)

# Alternative view that returns HttpResponse
def simple_view(request):
    """A simple Django view that returns HttpResponse"""
    return HttpResponse("This is a simple response from Django view")