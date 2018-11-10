from django.template import loader
from django.http import HttpResponse

# Create your views here.
def index(request):
    context={"test":3}
    template=loader.get_template('ruler/index.html')
    return HttpResponse(template.render(context,request))
