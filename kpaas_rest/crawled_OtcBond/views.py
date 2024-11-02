from django.shortcuts import render

# Create your views here.
from rest_framework import viewsets

import os, sys
from .models import OTC_Bond_Interest, OTC_Bond_Holding, OTC_Bond
from .serializers import OTC_Bond_Serializer, OTC_Bond_Interest_Serializer, OTC_Bond_Holding_Serializer


class OTC_Bond_All(viewsets.ReadOnlyModelViewSet):
    queryset = OTC_Bond.objects.all()
    serializer_class = OTC_Bond_Serializer

class OTC_Bond_Interest_view(viewsets.ModelViewSet):
    queryset = OTC_Bond_Interest.objects.all()
    serializer_class = OTC_Bond_Interest_Serializer

class OTC_Bond_Holding_view(viewsets.ModelViewSet):
    queryset = OTC_Bond_Holding.objects.all()
    serializer_class = OTC_Bond_Holding_Serializer
