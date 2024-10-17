import scrapy
from ..items import OtcBondScrapyItem
# 스크래피 해야할 정보
# 채권 코드 - Outside - 완
# 채권 명 - Outside - 완
# 발행일 - Outside - 완
# 만기일 - Outside - 완
# 채권 종류 - Inside - 완
# 위험도 - Outside - 완
# 이자 지급 구분  - Inside - 완
# 차기 이자 지급일 - 계산 - 완
# 이자 지급 주기 - Inside - 완
# 이자율 - Inside - 완
# 세전 수익률 - Outside - 완
# 세후 수익률 - Outside - 완
# 예상 수익금 - 계산 -> 스크래피 X
# 매수 단가 -> 완
# 중개 증권사 이름 - Outside -> 이 자체 - 완
class MiraeassetspiderSpider(scrapy.Spider):
    name = "miraeassetSpider"
    allowed_domains = ["securities.miraeasset.com"]
    start_urls = ["https://securities.miraeasset.com/hks/hks4036/r01.do"]
    bond_list = []

    def parse(self, response):
        bond_cnt = int(response.xpath('//*[@id="contents"]/div[1]/div[3]/span/text()').extract()[0])
        # bond_info = dict()
        bond_info = OtcBondScrapyItem()
        for i in range(1, 2 * bond_cnt + 1, 2):
            bond_info['trading_company_name'] = '미래에셋 증권'
            bond_info['bond_code'] = response.xpath('//*[@id="list"]/tbody/tr[' + str(i) + ']/td[1]/a/@href').extract()[0].split('?')[1].split('=')[1]
            bond_info['bond_name'] = response.xpath('//*[@id="list"]/tbody/tr[' + str(i) + ']/td[1]/a/text()').extract()[0]
            bond_info['danger_degree'] = response.xpath('//*[@id="list"]/tbody/tr[' + str(i) + ']/td[1]/p/span/em/text()').extract()[0]
            bond_info['pub_date'] = response.xpath('//*[@id="list"]/tbody/tr[' + str(i) + ']/td[4]/text()').extract()[0].replace('.', '')
            bond_info['mat_date'] = response.xpath('//*[@id="list"]/tbody/tr[' + str(i + 1) + ']/td[1]/text()').extract()[0].replace('.', '')
            bond_info['YTM'] = response.xpath('//*[@id="list"]/tbody/tr[' + str(i) + ']/td[6]/text()').extract()[0].replace('%', '')
            bond_info['YTM_after_tax'] = response.xpath('//*[@id="list"]/tbody/tr[' + str(i) + ']/td[7]/text()').extract()[0].replace('%', '')
            bond_info['price_per_10'] = response.xpath('//*[@id="list"]/tbody/tr[' + str(i + 1) + ']/td[2]/text()').extract()[0].replace(',', '')

            # bond_info = {
            #     'trading_company_name': '미래에셋 증권',
            #     # 채권 코드
            #     'bond_code': response.xpath('//*[@id="list"]/tbody/tr[' + str(i) + ']/td[1]/a/@href').extract()[0].split('?')[1].split('=')[1],
            #     # 채권 명
            #     'bond_name': response.xpath('//*[@id="list"]/tbody/tr[' + str(i) + ']/td[1]/a/text()').extract()[0],
            #     # 위험도
            #     'danger_degree':
            #         response.xpath('//*[@id="list"]/tbody/tr[' + str(i) + ']/td[1]/p/span/em/text()').extract()[0],
            #     # 발행일
            #     'pub_date': response.xpath('//*[@id="list"]/tbody/tr[' + str(i) + ']/td[4]/text()').extract()[
            #         0],
            #     # 만기일
            #     'mat_date': response.xpath('//*[@id="list"]/tbody/tr[' + str(i + 1) + ']/td[1]/text()').extract()[
            #         0],
            #     # 세전 수익률
            #     'YTM': response.xpath('//*[@id="list"]/tbody/tr[' + str(i) + ']/td[6]/text()').extract()[0].replace('%', ''),
            #     # 세후 수익률
            #     'YTM_after_tax': response.xpath('//*[@id="list"]/tbody/tr[' + str(i) + ']/td[7]/text()').extract()[0].replace('%', ''),
            #     # 매수 단가
            #     'price_per_10': response.xpath('//*[@id="list"]/tbody/tr[' + str(i + 1) + ']/td[2]/text()').extract()[0].replace(',', ''),
            # }
            # self.bond_list.append(bond_info)
            # print("d")
            yield scrapy.Request(url="https://securities.miraeasset.com/hks/hks4036/v01.do?itemCode=" + bond_info['bond_code'],
                                 callback=self.parse_bond_detail, meta={'bond_info': bond_info})

        return None


    def parse_bond_detail(self, response):
        bond_info = response.meta['bond_info']
        # print(response.xpath('//*[@id="contents"]/table/tbody/tr[1]/td[2]/text()').extract_first()[0])
        # 채권 유형
        bond_info['bond_type'] = response.xpath('//*[@id="contents"]/table/tbody/tr[1]/td[2]/text()').extract()[0]
        # 이자 지급 구분
        bond_info['int_pay_class'] = response.xpath('//*[@id="contents"]/table/tbody/tr[3]/td[2]/text()').extract()[0].strip()
        # 이자 지급 주기
        bond_info['int_pay_cycle'] = response.xpath('//*[@id="contents"]/table/tbody/tr[4]/td[2]/text()').extract()[0].split('개월')[0]
        # 이자율
        bond_info['interest_percentage'] = response.xpath('//*[@id="contents"]/table/tbody/tr[2]/td[2]/text()').extract()[0]
        yield bond_info
        # print(response.xpath('//*[@id="contents"]/table/tbody/tr[1]/td[2]/text()').extract()[0])