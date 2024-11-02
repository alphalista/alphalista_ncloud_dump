import os

from billiard.context import Process

from celery import shared_task
from scrapy.crawler import CrawlerProcess
from .OTC_bond_scrapy.spiders import shinhanSpider, miraeassetSpider, daishinSpider, kiwoomSpider
from scrapy.settings import Settings
from .models import OTC_Bond



def crawling_start():
    settings = Settings()
    settings_file_path = os.path.join(os.path.dirname(__file__), 'OTC_bond_scrapy', 'settings.py')
    settings.setmodule(settings_file_path, priority='project')

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

@shared_task
def delete_crawled_data():
    OTC_Bond.objects.all().delete()