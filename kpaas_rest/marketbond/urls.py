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
    MarketBondViewSet,
    ClickCountViewSet,
)

router = DefaultRouter()
router.register('marketbond', MarketBondViewSet)
router.register("issue-info", MarketBondIssueInfoViewSet)
router.register("search-info", MarketBondSearchInfoViewSet)
router.register("inquire-asking-price", MarketBondInquireAskingPriceViewSet)
router.register("avg-unit", MarketBondAvgUnitViewSet)
router.register("inquire-daily-item-chart-price", MarketBondInquireDailyItemChartPriceViewSet)
router.register("inquire-price", MarketBondInquirePriceViewSet)
router.register("inquire-ccnl", MarketBondInquireCCNLViewSet)
router.register("inquire-daily-price", MarketBondInquireDailyPriceViewSet),
router.register("click-count", ClickCountViewSet),


urlpatterns = router.urls
