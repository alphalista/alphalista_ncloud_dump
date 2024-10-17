# Define here the models for your scraped items
#
# See documentation in:
# https://docs.scrapy.org/en/latest/topics/items.html

# trading_company_name: 중개 증권사 이름
# bond_code: 채권 코드
# bond_name: 채권 명
# danger_degree: 투자(채권) 위험도
# pub_date: 발행일
# mat_date: 만기일
# YTM: 세전 수익률
# YTM_after_tax: 세후 수익률
# price_per_10: 수량 단위 천원으로 잡았을 때 수량 10개 단위 가격
# bond_type: 채권 종류
# int_pay_class: 이자 지급 구분
# int_pay_cycle: 이자 지급 주기
# interest_percentage: 이자율
# nxt_int_date: 차기 이자 지급일
# expt_income: 원금 포함 예상 수익금





import scrapy


class OtcBondScrapyItem(scrapy.Item):
    # define the fields for your item here like:
    # name = scrapy.Field()
    trading_company_name = scrapy.Field()
    bond_code = scrapy.Field()
    bond_name = scrapy.Field()
    danger_degree = scrapy.Field()
    pub_date = scrapy.Field()
    mat_date = scrapy.Field()
    YTM = scrapy.Field()
    YTM_after_tax = scrapy.Field()
    price_per_10 = scrapy.Field()
    bond_type = scrapy.Field()
    int_pay_class = scrapy.Field()
    int_pay_cycle = scrapy.Field()
    interest_percentage = scrapy.Field()
    nxt_int_date = scrapy.Field()
    expt_income = scrapy.Field()
    # duration 추가
    duration = scrapy.Field()
