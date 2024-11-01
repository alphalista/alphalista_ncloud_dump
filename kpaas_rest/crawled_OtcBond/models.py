from django.db import models
from django.contrib.auth.models import User
import os, sys
sys.path.append(os.path.abspath(os.path.join(os.path.dirname(__file__), '../../')))
sys.path.append(os.path.abspath(os.path.join(os.path.dirname(__file__), '../../kpaas_task/')))
sys.path.append(os.path.abspath(os.path.join(os.path.dirname(__file__), '../../kpaas_task/crawling/')))
from crawling.models import OTC_Bond
# Create your models here.


# 장외 관심 채권
class OTC_Bond_Interest(models.Model):
    user_id = models.ForeignKey(User, on_delete=models.CASCADE)
    bond_code = models.ForeignKey(OTC_Bond, on_delete=models.CASCADE)

    class Meta:
        unique_together = ('user_id', 'bond_code')