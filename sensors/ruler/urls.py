from django.urls import path

from . import views

urlpatterns = [
    path('', views.index, name='index'),
    path('fake', views.fake, name='fake'),
    path('set', views.set, name='fake'),
    path('getDistance', views.getDistance, name='getDistance'),

]
