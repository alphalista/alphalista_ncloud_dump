import scrapy
import os, sys
sys.path.append(os.path.abspath(os.path.join(os.path.dirname(__file__), '../../../')))
from crawling.OTC_bond_scrapy.items import OtcBondScrapyItem
import json
import copy

class ShinhanspiderSpider(scrapy.Spider):
    name = "shinhanSpider"
    allowed_domains = ["www.shinhansec.com"]
    start_urls = ["https://www.shinhansec.com/siw/wealth-management/bond-rp/5901/data.do"]

    def parse(self, response):
        item = OtcBondScrapyItem()
        lists = json.loads(response.body)['body']['list']
        for it in lists:
            item['trading_company_name'] = '신한투자 증권'
            item['bond_code'] = it['종목코드']
            item['bond_name'] = it['채권종목한글명']
            item['danger_degree'] = it['상품위험등급명']
            item['pub_date'] = it['발행일자']
            item['mat_date'] = it['만기일자']
            item['YTM'] = it['상품채권세전수익율']
            item['YTM_after_tax'] = it['상품채권세후수익율']
            item['price_per_10'] = it['상품채권매매단가']
            item['bond_type'] = it['거래소채권분류명']
            item['int_pay_class'] = it['채권이자지급방법명'] + '채'
            item['interest_percentage'] = it['채권이자율']

            url = 'https://www.shinhansec.com/siw/wealth-management/bond-rp/5901P02/data.do'
            form_data = {
                        # "header": {
                        #     "TCD": "S",
                        #     "SDT": "20241014130052262",
                        #     "SVW": "/siw/wealth-management/bond-rp/5901P02/view-popup.do"
                        # },
                        "body": {
                            "bondCode": f"{it['종목코드']}",
                            "bondType": f"{it['채권이자지급방법코드']}",
                            "parentLocation": {}
                        }
            }
            headers = {'Content-Type': 'application/json'}
            yield scrapy.Request(url, method='POST', body=json.dumps(form_data), headers=headers, callback=self.detail_parse, meta={'item': copy.deepcopy(item)})

    def detail_parse(self, response):
        data = json.loads(response.body)
        item = response.meta['item']
        item['int_pay_cycle'] = data['body']['bondProfitInfo']['이자지급주기명'].replace('개월', '')
        yield item