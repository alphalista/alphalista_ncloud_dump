# Create your tasks here


from celery import shared_task
from kpaas_task.celery import app
from marketbond.kib_api.collect_kis_data import CollectMarketBond


@shared_task()
def test():
    print('market')


@shared_task()
def market_bond_issue_info():
    collector = CollectMarketBond(pdno='KR6150351E98', bond_code='KR6150351E98')
    collector.store_market_bond_issue_info()
    print('market bond issue info')


@shared_task()
def market_bond_search_info():
    collector = CollectMarketBond('KR6150351E98')
    collector.store_market_bond_search_info()
    print('market bond search info')


@shared_task()
def market_bond_inquire_asking_price():
    collector = CollectMarketBond('KR6150351E98')
    collector.store_market_bond_inquire_asking_price()
    print('market bond inquire asking price')


@shared_task()
def market_bond_avg_unit():
    collector = CollectMarketBond('KR6150351E98')
    collector.store_market_bond_avg_unit()
    print('market bond avg unit')


@shared_task()
def market_bond_inquire_daily_itemchartprice():
    collector = CollectMarketBond('KR6150351E98')
    collector.store_market_bond_inquire_daily_itemchartprice()
    print('market bond inquire daily item chart price')


@shared_task()
def market_bond_inquire_price():
    collector = CollectMarketBond('KR6150351E98')
    collector.store_market_bond_inquire_price()
    print('market bond inquire price')


@shared_task()
def market_bond_inquire_ccnl():
    collector = CollectMarketBond('KR6150351E98')
    collector.store_market_bond_inquire_ccnl()
    print('market bond inquire ccnl')


@shared_task()
def market_bond_inquire_daily_price():
    collector = CollectMarketBond('KR6150351E98')
    collector.store_market_bond_inquire_daily_price()
    print('market bond inquire daily price')


@shared_task()
def market_search_bond_info():
    collector = CollectMarketBond('KR6150351E98')
    collector.store_market_bond_search_info()
    print('market search bond info')

