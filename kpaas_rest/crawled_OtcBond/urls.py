from django.urls import path
from rest_framework.routers import DefaultRouter
from .views import OTC_Bond_All

router = DefaultRouter()
router.register("otc-bond-all", OTC_Bond_All)
urlpatterns = router.urls
