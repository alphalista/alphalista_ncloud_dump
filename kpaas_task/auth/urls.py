from django.urls import path
from .views import KakaoCallbackAPIView

urlpatterns = [
    path('login/kakao-callback', KakaoCallbackAPIView.as_view(), name='kakao_callback'),
]
