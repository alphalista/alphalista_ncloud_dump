import sys, os
sys.path.append(os.path.abspath(os.path.join(os.path.dirname(__file__), './OTC_bond_scrapy')))
sys.path.append(os.path.abspath(os.path.join(os.path.dirname(__file__), '../crawling')))


import logging
from billiard.context import Process

# from django.conf import settings
from celery import app, shared_task
from celery.utils.log import get_task_logger
import scrapy
from scrapy.crawler import CrawlerProcess, logger
from .OTC_bond_scrapy.spiders import shinhanSpider, miraeassetSpider, daishinSpider
from scrapy.settings import Settings

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
    process.start()

@shared_task
def crawling():
    proc = Process(target=crawling_start)
    proc.start()
    proc.join()