import sys, os
from django.utils import timezone

sys.path.append(os.path.abspath(os.path.join(os.path.dirname(__file__), './OTC_bond_scrapy')))
sys.path.append(os.path.abspath(os.path.join(os.path.dirname(__file__), '../crawling')))


import logging
from billiard.context import Process

# from django.conf import settings
from celery import app, shared_task
from celery.utils.log import get_task_logger
import scrapy
from scrapy.crawler import CrawlerProcess, logger
from .OTC_bond_scrapy.spiders import shinhanSpider, miraeassetSpider, daishinSpider, kiwoomSpider
from scrapy.settings import Settings
import django
sys.path.append(os.path.abspath(os.path.join(os.path.dirname(__file__), '../../')))
# Django 프로젝트의 설정 파일 경로 설정
os.environ.setdefault('DJANGO_SETTINGS_MODULE', 'config.settings')  # Django 프로젝트의 settings.py 경로로 대체
django.setup()  # Django 앱 로드
from .models import OTC_Bond, OTC_Bond_Holding
from django.apps import apps

from scrapy.utils.project import get_project_settings

# settings = get_project_settings()
settings = Settings()
os.environ['SCRAPY_SETTINGS_MODULE'] = 'crawling.OTC_bond_scrapy.settings'
settings_module_path = os.environ['SCRAPY_SETTINGS_MODULE']
settings.setmodule(settings_module_path, priority='project')

def crawling_start():
    process = CrawlerProcess(settings)
    process.crawl(miraeassetSpider.MiraeassetspiderSpider)
    process.crawl(shinhanSpider.ShinhanspiderSpider)
    process.crawl(daishinSpider.DaishinspiderSpider)
    process.crawl(kiwoomSpider.KiwoomspiderSpider)
    process.start()

@shared_task
def crawling():
    proc = Process(target=crawling_start)
    proc.start()
    proc.join()


# @shared_task
# def delete_holding_bonds():
#     expired = OTC_Bond_Holding.objects.filter(date__lt=timezone.now())
#     for instance in expired:

