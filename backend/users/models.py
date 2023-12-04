from django.db import models

# Create your models here.
class User(models.Model):
    idOrg = models.AutoField(primary_key=True)
    nome = models.CharField(max_length=256)
    email = models.EmailField()
    cnpj = models.CharField(max_length=14)
    senha = models.CharField(max_length=100)