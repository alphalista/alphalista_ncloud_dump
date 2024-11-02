from django.shortcuts import render

# Create your views here.
from rest_framework import viewsets
from django.utils import timezone
import os, sys
sys.path.append(os.path.abspath(os.path.join(os.path.dirname(__file__), '../../')))
sys.path.append(os.path.abspath(os.path.join(os.path.dirname(__file__), '../../kpaas_task/')))
sys.path.append(os.path.abspath(os.path.join(os.path.dirname(__file__), '../../kpaas_task/crawling/')))
from crawling.models import OTC_Bond
from .models import OTC_Bond_Interest, OTC_Bond_Holding
from .serializers import OTC_Bond_Serializer, OTC_Bond_Interest_Serializer, OTC_Bond_Holding_Serializer


class OTC_Bond_All(viewsets.ReadOnlyModelViewSet):
    queryset = OTC_Bond.objects.filter(add_date=timezone.now())
    serializer_class = OTC_Bond_Serializer

class OTC_Bond_Interest_view(viewsets.ModelViewSet):
    serializer_class = OTC_Bond_Interest_Serializer

    def get_queryset(self):
        user_id = self.kwargs.get('user_id')
        if user_id is not None:
            return OTC_Bond_Interest.objects.filter(user_id=user_id)
        return OTC_Bond_Interest.objects.all()

class OTC_Bond_Holding_view(viewsets.ModelViewSet):
    serializer_class = OTC_Bond_Holding_Serializer

    def get_queryset(self):
        user_id = self.kwargs.get('user_id')
        if user_id is not None:
            return OTC_Bond_Holding.objects.filter(user_id=user_id)
        return OTC_Bond_Holding.objects.all()
