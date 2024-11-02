from django.urls import path, include
from rest_framework.routers import DefaultRouter
from .views import OTC_Bond_All, OTC_Bond_Interest_view, OTC_Bond_Holding_view

router = DefaultRouter()
router.register("otc-bond-all", OTC_Bond_All)
# router.register("interest", OTC_Bond_Interest_view)
urlpatterns = [
    path('', include(router.urls)),
    path('holding/<str:user_id>/', OTC_Bond_Holding_view.as_view({
            'get': 'list',          # 전체 목록 조회
            'post': 'create',       # 새 인스턴스 생성
            'put': 'update',        # 전체 업데이트
            'patch': 'partial_update',  # 부분 업데이트
            'delete': 'destroy'     # 삭제
        }
    )),
    path('interest/<str:user_id>/', OTC_Bond_Interest_view.as_view({
            'get': 'list',          # 전체 목록 조회
            'post': 'create',       # 새 인스턴스 생성
            'put': 'update',        # 전체 업데이트
            'patch': 'partial_update',  # 부분 업데이트
            'delete': 'destroy'     # 삭제
    }))
]
