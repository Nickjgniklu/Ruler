from django.template import loader
from django.http import HttpResponse
from django.shortcuts import redirect
from django.utils import timezone
from .models import Measurement
# Create your views here.
def index(request):
    context={"distance":Measurement.objects.all()[0].distance}
    template=loader.get_template('ruler/index.html')
    return HttpResponse(template.render(context,request))
def fake(request):
    if(len(Measurement.objects.all())<1):
        m= Measurement(name="inches",distance="100",date_posted=timezone.now())
        m.save()
    else:
       m= Measurement.objects.all()[0]
       m.distance = request.GET["distance"]
       m.save()

    return redirect('index')
def getDistance(request):
    return HttpResponse(Measurement.objects.all()[0].distance)
