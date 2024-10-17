from rest_framework.response import Response
from rest_framework.decorators import action

from .models import (
    MarketBond,
    MarketBondCode,
    MarketBondIssueInfo,
    MarketBondSearchInfo,
    MarketBondInquireAskingPrice,
    MarketBondAvgUnit,
    MarketBondInquireDailyItemChartPrice,
    MarketBondInquirePrice,
    MarketBondInquireCCNL,
    MarketBondInquireDailyPrice,
    ClickCount,
)

from .serializer import (
    MarketBondSerializer,
    MarketBondCodeSerializer,
    MarketBondIssueInfoSerializer,
    MarketBondSearchInfoSerializer,
    MarketBondInquireAskingPriceSerializer,
    MarketBondAvgUnitSerializer,
    MarketBondInquireDailyItemChartPriceSerializer,
    MarketBondInquirePriceSerializer,
    MarketBondInquireCCNLSerializer,
    MarketBondInquireDailyPriceSerializer,
    ClickCountSerializer,
)


from rest_framework import viewsets, status


# Create your views here.

class MarketBondViewSet(viewsets.ReadOnlyModelViewSet):
    queryset = MarketBond.objects.all()
    serializer_class = MarketBondSerializer

class MarketBondCodeViewSet(viewsets.ReadOnlyModelViewSet):
    queryset = MarketBondCode.objects.all()
    serializer_class = MarketBondCodeSerializer


class MarketBondIssueInfoViewSet(viewsets.ReadOnlyModelViewSet):
    queryset = MarketBondIssueInfo.objects.all()
    serializer_class = MarketBondIssueInfoSerializer


class MarketBondSearchInfoViewSet(viewsets.ReadOnlyModelViewSet):
    queryset = MarketBondSearchInfo.objects.all()
    serializer_class = MarketBondSearchInfoSerializer


class MarketBondInquireAskingPriceViewSet(viewsets.ReadOnlyModelViewSet):
    queryset = MarketBondInquireAskingPrice.objects.all()
    serializer_class = MarketBondInquireAskingPriceSerializer


class MarketBondAvgUnitViewSet(viewsets.ReadOnlyModelViewSet):
    queryset = MarketBondAvgUnit.objects.all()
    serializer_class = MarketBondAvgUnitSerializer


class MarketBondInquireDailyItemChartPriceViewSet(viewsets.ReadOnlyModelViewSet):
    queryset = MarketBondInquireDailyItemChartPrice.objects.all()
    serializer_class = MarketBondInquireDailyItemChartPriceSerializer


class MarketBondInquirePriceViewSet(viewsets.ReadOnlyModelViewSet):
    queryset = MarketBondInquirePrice.objects.all()
    serializer_class = MarketBondInquirePriceSerializer


class MarketBondInquireCCNLViewSet(viewsets.ReadOnlyModelViewSet):
    queryset = MarketBondInquireCCNL.objects.all()
    serializer_class = MarketBondInquireCCNLSerializer


class MarketBondInquireDailyPriceViewSet(viewsets.ReadOnlyModelViewSet):
    queryset = MarketBondInquireDailyPrice.objects.all()
    serializer_class = MarketBondInquireDailyPriceSerializer


class ClickCountViewSet(viewsets.ReadOnlyModelViewSet):
    queryset = ClickCount.objects.all()
    serializer_class = ClickCountSerializer
    @action(detail=False, methods=['post'])
    def record_click(self, request, *args, **kwargs):
        code = request.data['code']
        if not code:
            return Response({'error': 'code is empty'}, status=status.HTTP_400_BAD_REQUEST)
        else:
            marketbond = MarketBond.objects.filter(code=code).first()
            if marketbond:
                click_count, created = ClickCount.objects.get_or_create(marketbond=marketbond)
                click_count.increment()
                click_count.save()
                serializer = self.get_serializer(click_count)
                return Response(serializer.data)
            else:
                return Response({'error': 'marketbond does not exist'}, status=status.HTTP_400_BAD_REQUEST)

