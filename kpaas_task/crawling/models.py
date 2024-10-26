from django.db import models

# Create your models here.

class OTC_Bond(models.Model):
    trading_company_name = models.CharField(max_length=100)
    bond_code = models.CharField(max_length=100)
    bond_name = models.CharField(max_length=100)
    danger_degree = models.CharField(max_length=100)
    pub_date = models.CharField(max_length=100)
    mat_date = models.CharField(max_length=100)
    YTM = models.CharField(max_length=100)
    YTM_after_tax = models.CharField(max_length=100)
    price_per_10 = models.CharField(max_length=100)
    bond_type = models.CharField(max_length=100)
    int_pay_class = models.CharField(max_length=100)
    int_pay_cycle = models.CharField(max_length=100)
    interest_percentage = models.CharField(max_length=100)
    nxt_int_date = models.CharField(max_length=100)
    expt_income = models.CharField(max_length=100)
    # duration 추가
    duration = models.CharField(max_length=100)