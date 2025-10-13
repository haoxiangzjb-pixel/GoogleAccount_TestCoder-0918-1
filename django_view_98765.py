from django.shortcuts import render

def my_random_view(request):
    context = {
        'message': 'Hello from the randomly named Django view!'
    }
    return render(request, 'hello_world_12345.html', context)