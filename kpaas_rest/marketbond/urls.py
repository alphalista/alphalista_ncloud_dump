from rest_framework.routers import DefaultRouter

from .views import (
    MarketBondIssueInfoViewSet,
    MarketBondSearchInfoViewSet,
    MarketBondInquireAskingPriceViewSet,
    MarketBondAvgUnitViewSet,
    MarketBondInquireDailyItemChartPriceViewSet,
    MarketBondInquirePriceViewSet,
    MarketBondInquireCCNLViewSet,
    MarketBondInquireDailyPriceViewSet,
)

router = DefaultRouter()
router.register("mb-issue-info", MarketBondIssueInfoViewSet)
router.register("mb-search-info", MarketBondSearchInfoViewSet)
router.register("mb-inquire-asking-price", MarketBondInquireAskingPriceViewSet)
router.register("mb-avg-unit", MarketBondAvgUnitViewSet)
router.register("mb-inquire-daily-item-chart-price", MarketBondInquireDailyItemChartPriceViewSet)
router.register("mb-inquire-price", MarketBondInquirePriceViewSet)
router.register("mb-inquire-ccnl", MarketBondInquireCCNLViewSet)
router.register("mb-inquire-daily-price", MarketBondInquireDailyPriceViewSet)


urlpatterns = router.urls
