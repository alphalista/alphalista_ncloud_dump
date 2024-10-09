# Create your tasks here


from celery import shared_task
from marketbond.kib_api.collect_kis_data import CollectMarketBond, CollectMarketCode
from itertools import cycle
from marketbond.models import MarketBondCode

pdno_cycle = None

@shared_task
def market_bond_code_info():
    print('start')
    collector = CollectMarketCode()
    collector.store_market_codes()
    initialize_pdno_list()
    print('market codes')

@shared_task()
def initialize_pdno_list():
    global pdno_cycle
    pdno_list = list(MarketBondCode.objects.values_list('code', flat=True))
    pdno_cycle = cycle(pdno_list)
    print('initialized pdno list')


@shared_task()
def market_bond_issue_info():
    print('market_bond_issue_info')
    global pdno_cycle
    if pdno_cycle is None:
        initialize_pdno_list()
    try:
        pdno = next(pdno_cycle)
        print(pdno, 'start', end=' ')
        code = MarketBondCode.objects.filter(code=pdno).first()
        collector = CollectMarketBond(pdno=pdno, bond_code=code)
        collector.store_market_bond_issue_info()
        print('end')
    except StopIteration:
        print('pdno not found')


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

