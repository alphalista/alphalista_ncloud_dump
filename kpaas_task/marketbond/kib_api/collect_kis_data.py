from marketbond.models import (
    MarketBondCode,
    MarketBondIssueInfo,
    MarketBondSearchInfo,
    MarketBondInquireAskingPrice,
    MarketBondAvgUnit,
    MarketBondInquireDailyItemChartPrice,
    MarketBondInquirePrice,
    MarketBondInquireCCNL,
    MarketBondInquireDailyPrice,
)

from marketbond.serializer import (
    MarketBondCodeSerializer,
    MarketBondIssueInfoSerializer,
    MarketBondSearchInfoSerializer,
    MarketBondInquireAskingPriceSerializer,
    MarketBondAvgUnitSerializer,
    MarketBondInquireDailyItemChartPriceSerializer,
    MarketBondInquirePriceSerializer,
    MarketBondInquireCCNLSerializer,
    MarketBondInquireDailyPriceSerializer,
)

from marketbond.kib_api.get_rest_data import GetRestData, GetCodeData

class CollectMarketCode:
    def __init__(self):
        self.data_getter = GetCodeData()


    def store_market_codes(self):
        code_name_list = self.data_getter.get_data()
        serializer = MarketBondCodeSerializer(data=code_name_list, many=True)
        if serializer.is_valid():
            serializer.save()



class CollectMarketBond:
    def __init__(self, pdno="KR6150351E98", bond_code=""):
        self.pdno = pdno
        self.bond_code = bond_code
        self.data_getter = GetRestData(pdno=self.pdno, bond_code=self.bond_code)

    def store_market_bond_issue_info(self):
        if self.bond_code:
            instance = MarketBondIssueInfo.objects.filter(code=self.bond_code).first()
            data = self.data_getter.get_issue_info()
            if instance:
                serializer = MarketBondIssueInfoSerializer(instance, data=data)
            else:
                serializer = MarketBondIssueInfoSerializer(data=data)
            if serializer.is_valid():
                serializer.save()
        else:
            print('fail')

    def store_market_bond_search_info(self):
        data = self.data_getter.get_search_bond_info()
        serializer = MarketBondSearchInfoSerializer(data=data)
        if serializer.is_valid():
            serializer.save()

    def store_market_bond_inquire_asking_price(self):
        if self.bond_code:
            instance = MarketBondInquireAskingPrice.objects.filter(code=self.bond_code).first()
            data = self.data_getter.get_inquire_asking_price()
            if instance:
                serializer = MarketBondInquireAskingPriceSerializer(instance, data=data)
            else:
                serializer = MarketBondInquireAskingPriceSerializer(data=data)
            if serializer.is_valid():
                serializer.save()
        else:
            print('fail')

    def store_market_bond_avg_unit(self):
        data = self.data_getter.get_avg_unit()
        serializer = MarketBondAvgUnitSerializer(data=data)
        if serializer.is_valid():
            serializer.save()
            return serializer.data

    def store_market_bond_inquire_daily_itemchartprice(self):
        data = self.data_getter.get_inquire_daily_itemchartprice()
        serializer = MarketBondInquireDailyItemChartPriceSerializer(
            data=data, many=True
        )
        if serializer.is_valid():
            serializer.save()

    def store_market_bond_inquire_price(self):
        data = self.data_getter.get_inquire_price()
        serializer = MarketBondInquirePriceSerializer(data=data)
        if serializer.is_valid():
            serializer.save()

    def store_market_bond_inquire_ccnl(self):
        data = self.data_getter.get_inquire_ccnl()
        serializer = MarketBondInquireCCNLSerializer(data=data, many=True)
        if serializer.is_valid():
            serializer.save()

    def store_market_bond_inquire_daily_price(self):
        data = self.data_getter.get_inquire_daily_price()
        serializer = MarketBondInquireDailyPriceSerializer(data=data, many=True)
        if serializer.is_valid():
            serializer.save()

    def store_market_search_bond_info(self):
        data = self.data_getter.get_search_bond_info()
        serializer = MarketBondSearchInfoSerializer(data=data)
        if serializer.is_valid():
            serializer.save()
