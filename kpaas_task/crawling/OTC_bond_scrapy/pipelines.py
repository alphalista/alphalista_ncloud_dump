# Define your item pipelines here
#
# Don't forget to add your pipeline to the ITEM_PIPELINES setting
# See: https://docs.scrapy.org/en/latest/topics/item-pipeline.html
from calendar import month

# useful for handling different item types with a single interface
from itemadapter import ItemAdapter
import datetime
from dateutil.relativedelta import relativedelta
import mysql.connector
from twisted.spread.pb import portno


class OtcBondScrapyPipeline:
    def __init__(self):
        print('start')
        try:
            self.conn = mysql.connector.connect(user='root', password='ytk-10122713', database='bonddb',
                                                host='localhost', port='3306')
            self.myCursor = self.conn.cursor()
            print('INFO', 'SUCCESS')
        except Exception as e:
            print('ERROR:', e)

    def process_item(self, item, spider):
        print('hello')
        if spider.name == 'miraeassetSpider' or spider.name == 'shinhanSpider' or spider.name == 'daishinSpider':
            pub_date = item['pub_date']
            mat_date = item['mat_date']
            int_cycle = item['int_pay_cycle']
            # 다음 이자 지급일 추가
            item['nxt_int_date'] = self.nxt_int_date(pub_date, mat_date, int_cycle)
            item['expt_income'] = str(self.expt_money(float(item['price_per_10']), float(item['interest_percentage']), item['nxt_int_date'].replace('.', ''),
                                                  mat_date.replace('.', ''), int(int_cycle)))
            item['duration'] = 'NONE'
            self.myCursor.execute(
                'insert into bonddb.Bonds(trading_company_name, bond_code, bond_name, danger_degree,' +
                'pub_date, mat_date, YTM, YTM_after_tax, price_per_10, bond_type, int_pay_class, int_pay_cycle,' +
                'interest_percentage, nxt_int_date, expt_income, duration) values (%s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s)'
                , (item['trading_company_name'], item['bond_code'], item['bond_name'], item['danger_degree'], item['pub_date'],
                   item['mat_date'], item['YTM'],item['YTM_after_tax'], item['price_per_10'], item['bond_type'],
                   item['int_pay_class'], item['int_pay_cycle'], item['interest_percentage'], item['nxt_int_date'], item['expt_income'],
                   item['duration'])
            )
            self.conn.commit()

        # print(item)
        return item

    # 다음 이자 지급일
    def nxt_int_date(self, pub_date, mat_date, int_cycle):
        # sp = pub_date.split('.')
        pub_date = datetime.datetime(int(pub_date[:4]), int(pub_date[4:6]), int(pub_date[6:]))
        # sp = mat_date.split('.')
        mat_date = datetime.datetime(int(mat_date[:4]), int(mat_date[4:6]), int(mat_date[6:]))
        # print('hello', mat_date.strftime("%Y.%m.%d"))
        int_cycle = relativedelta(months=int(int_cycle))
        nxt_date = (pub_date + int_cycle)
        while nxt_date < datetime.datetime.now():
            nxt_date += int_cycle
        if nxt_date > mat_date:
            nxt_date = mat_date.strftime("%Y%m%d")
        nxt_date = nxt_date.strftime("%Y%m%d")
        return nxt_date

    def interest_money(self, face_value, percent, int_cycle):
        return face_value * (percent * 0.01) / (12 / int_cycle)

    # 예상 세후 수익금을 계산하는 함수 입니다.
    # price_per_10, int: 단위가 천원인 매수 수량이 10개일 때의 기준 가격을 의미합니다.
    # interest_percent, float: 연간 수익율을 의미합니다.
    # nxt_interest_date, str(YYYYmmdd): 다음 이자 지급일을 의미합니다.
    # mat_date str(YYYYmmdd): 만기일을 의미합니다.
    # interest_cycle_period, int: 이자 지급 주기를 의미합니다.
    def expt_money(self, price_per_10, interest_percent, nxt_interest_date, mat_date, interest_cycle_period):
        """
        :param price_per_10, int:
        :param interest_percent float:
        :param nxt_interest_date, str(YYYYmmdd):
        :param mat_date str(YYYYmmdd):
        :param interest_cycle_period, int:
        :return:
        """
        # 매수 수량(단위 천원) 만원 당 계산으로 들어갑니다.
        PUR_CNT = 10
        face_value = PUR_CNT * 1000
        price = price_per_10 * PUR_CNT / 10
        remaining_interest_period = self.get_remaining_interest_period(nxt_interest_date, mat_date, interest_cycle_period)
        interest = self.interest_money(face_value, interest_percent, interest_cycle_period) # 회당 이자
        tot_interest = interest * remaining_interest_period
        tax = interest * 0.154 * remaining_interest_period
        # 지금 대비 수익
        # return round(face_value + tot_interest - tax - price, 2)
        # 만기 수익
        return round(face_value + tot_interest - tax, 2)

    def get_remaining_interest_period(self, next_interest_date, maturity_date, interest_cycle_period):
        count = 0
        # print(int(next_interest_date[:4]), int(next_interest_date[4:6]), 1)
        next_interest_date = datetime.datetime(int(next_interest_date[:4]), int(next_interest_date[4:6]),
                                               1)  # 연, 월, 일 넣는다. 일수는 이자 지급일자와 만기일자는 같기 때문에 1로 가정한다.
        maturity_date = datetime.datetime(int(maturity_date[:4]), int(maturity_date[4:6]), 1)
        interest_cycle_period = relativedelta(months=interest_cycle_period)
        while next_interest_date <= maturity_date:  # 만기 달을 넘어설 때까지 계속 더해나갑니다.
            next_interest_date += interest_cycle_period
            count += 1
        return count