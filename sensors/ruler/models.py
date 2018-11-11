from django.db import models

# Create your models here.
class Measurement(models.Model):
    name= models.CharField(max_length=30)
    distance = models.CharField(max_length=30)
    date_posted = models.DateTimeField('Posted Date')

    def __str__(self):
        return f"{self.name}({self.id})"