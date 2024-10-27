# from .models import OTC_Bond
from rest_framework import serializers
import os, sys
sys.path.append(os.path.abspath(os.path.join(os.path.dirname(__file__), '../../')))
sys.path.append(os.path.abspath(os.path.join(os.path.dirname(__file__), '../../kpaas_task/')))
sys.path.append(os.path.abspath(os.path.join(os.path.dirname(__file__), '../../kpaas_task/crawling/')))
from crawling.models import OTC_Bond

class OTC_Bond_Serializer(serializers.ModelSerializer):
    class Meta:
        model = OTC_Bond
        fields = '__all__'

