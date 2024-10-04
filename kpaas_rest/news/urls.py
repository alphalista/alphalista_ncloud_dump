from rest_framework.routers import DefaultRouter

from .views import (
    NaverNewsViewSet,
)

router = DefaultRouter()
router.register("data", NaverNewsViewSet)


urlpatterns = router.urls
