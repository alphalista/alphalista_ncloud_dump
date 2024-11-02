from django.contrib import admin
from .models import OTC_Bond_Interest, OTC_Bond_Holding

# Register your models here.
admin.site.register(OTC_Bond_Interest)
admin.site.register(OTC_Bond_Holding)