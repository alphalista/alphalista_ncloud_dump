import scrapy
from ..items import OtcBondScrapyItem
import copy


class DaishinspiderSpider(scrapy.Spider):
    name = "daishinSpider"
    allowed_domains = ["www.daishin.com"]
    start_urls = ["https://www.daishin.com/g.ds?m=1019&p=1210&v=797"]

    def parse(self, response):
        item = OtcBondScrapyItem()
        cnt = 1
        while True:
            res = response.xpath('//*[@id="excel"]/tbody/tr[' + str(cnt) + ']/td[1]/div/div/p[2]/a[1]').extract_first()
            # print(response.xpath('//*[@id="excel"]/tbody/tr[' + str(cnt) + ']/td[1]/div/div/p[2]/a[1]').extract_first().split('fun_view(\'')[1].split('\'')[0])
            # break
            if res is None:
                break
            item['trading_company_name'] = '대신 증권'
            item['bond_code'] = response.xpath(
                '//*[@id="excel"]/tbody/tr[' + str(cnt) + ']/td[1]/div/div/p[2]/a[1]').extract_first().split(
                'fun_view(\'')[1].split('\'')[0]
            item['bond_name'] = response.xpath(
                '//*[@id="excel"]/tbody/tr[' + str(cnt) + ']/td[1]/div/div/p[2]/a[1]/text()').extract_first()
            # item['pub_date']
            # item['mat_date']
            item['YTM'] = response.xpath('//*[@id="excel"]/tbody/tr[' + str(cnt) + ']/td[5]/div/text()').extract_first()
            item['YTM_after_tax'] = response.xpath('//*[@id="excel"]/tbody/tr[' + str(cnt) + ']/td[6]/div/text()').extract_first()
            body = f'JONGMOK_CD={item['bond_code']}&JONGMOK_NAME={item['bond_name']}&MENU_GB=2&LISTTYPE=2'
            headers = {
                'Content-Type': 'application/x-www-form-urlencoded',
            }
            cnt += 1
            yield scrapy.Request(url='https://www.daishin.com/content/w/fnmall/bondrp/unlistedBondDesc.ds?p=1320&v=869&m=1019',
                                 method='POST',
                                 body=body,
                                 headers=headers,
                                 meta={'item': copy.deepcopy(item)},
                                 callback=self.detail_parse)

    def detail_parse(self, response):
        item = response.meta['item']
        item['pub_date'] = response.xpath('//*[@id="container"]/div/div/div/div[1]/table/tbody/tr/td[3]/div/div/text()').extract_first().replace('/', '').strip()
        item['mat_date'] = response.xpath('//*[@id="container"]/div/div/div/div[1]/table/tbody/tr/td[2]/div/div/text()').extract_first().replace('/', '').strip()
        item['price_per_10'] = response.xpath('//*[@id="container"]/div/div/div/div[5]/div/div[2]/table/tbody/tr[2]/td[4]/div/text()').extract_first().replace(',', '')
        item['bond_type'] = response.xpath('//*[@id="container"]/div/div/div/div[1]/table/tbody/tr/td[1]/div/div/p/text()').extract_first()
        item['int_pay_class'] = response.xpath('//*[@id="container"]/div/div/div/div[3]/table/tbody/tr[1]/td[4]/div/text()').extract_first()
        item['int_pay_cycle'] = response.xpath('//*[@id="container"]/div/div/div/div[3]/table/tbody/tr[1]/td[2]/div/text()').extract_first()
        item['interest_percentage'] = response.xpath('//*[@id="container"]/div/div/div/div[1]/table/tbody/tr/td[4]/div/div/text()').extract_first().replace('%', '').strip()
        danger_cd = ''
        try:
            danger_cd = response.xpath('//*[@id="container"]/div/div/div/div[1]/div/p[1]/img[2]/@src').extract_first().split('/DW/images/ico/ico_danger')[1].split('.')[0]
            if danger_cd is None:
                raise Exception()
        except:
            danger_cd = response.xpath('//*[@id="container"]/div/div/div/div[1]/div/p[1]/img/@src').extract_first().split('/DW/images/ico/ico_danger')[1].split('.')[0]

        danger_cd = int(danger_cd)
        # 위험도 코드를 if문으로 재가공하여 한글로 위험도 제공
        if danger_cd == 1: danger_cd = '매우낮은위험'
        elif danger_cd == 2: danger_cd = '낮은위험'
        elif danger_cd == 3: danger_cd = '보통위험'
        elif danger_cd == 4: danger_cd = '다소높은위험'
        elif danger_cd == 5: danger_cd = '높은위험'
        elif danger_cd == 6: danger_cd = '매우높은위험'
        item['danger_degree'] = danger_cd
        yield item
