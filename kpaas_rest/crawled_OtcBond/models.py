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

class OTC_Bond_Holding(models.Model):
    user_id = models.ForeignKey(User, on_delete=models.CASCADE, related_name='holding_bonds')
    bond_code = models.ForeignKey(OTC_Bond, on_delete=models.CASCADE, related_name='holding_bonds')
    price_per_10 = models.CharField(max_length=100) # 1만원 채권당 매수단가
    quantity = models.CharField(max_length=100)
    purchase_date = models.CharField(max_length=100)
    expire_date = models.DateField()
    class Meta:
        db_table = 'OTC_Bond_Holding'
        unique_together = ('user_id', 'bond_code')

class OTC_Bond_Expired(models.Model):
    user_id = models.ForeignKey(User, on_delete=models.CASCADE, related_name='expired_bonds')
    bond_code = models.ForeignKey(OTC_Bond, on_delete=models.CASCADE, related_name='expired_bonds')
    class Meta:
        db_table = 'OTC_Bond_Expired'

class OtcBondPreDataDays(models.Model):
    bond_code = models.ForeignKey(OTC_Bond, on_delete=models.CASCADE, related_name='pre_data_set')
    add_date = models.DateField(auto_now_add=True)
    duration = models.CharField(max_length=100)
    price = models.CharField(max_length=100)
    class Meta:
        db_table = 'OtcBondPreData'

class OtcBondPreDataWeeks(models.Model):
    bond_code = models.ForeignKey(OTC_Bond, on_delete=models.CASCADE, related_name='pre_data_weeks_set')
    add_date = models.DateField(auto_now_add=True)
    duration = models.CharField(max_length=100)
    price = models.CharField(max_length=100)

    class Meta:
        db_table = 'OtcBondPreDataWeeks'

class OtcBondPreDataMonths(models.Model):
    bond_code = models.ForeignKey(OTC_Bond, on_delete=models.CASCADE, related_name='pre_data_months_set')
    add_date = models.DateField(auto_now_add=True)
    duration = models.CharField(max_length=100)
    price = models.CharField(max_length=100)

    class Meta:
        db_table = 'OtcBondPreDataMonths'