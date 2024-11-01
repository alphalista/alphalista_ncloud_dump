from django.urls import path
from rest_framework.routers import DefaultRouter
from .views import OTC_Bond_All, OTC_Bond_Interest_view

router = DefaultRouter()
router.register("otc-bond-all", OTC_Bond_All)
router.register("interest", OTC_Bond_Interest_view)
urlpatterns = router.urls
