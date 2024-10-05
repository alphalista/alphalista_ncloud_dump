from .models import (
    SearchKeyword,
    NaverNews,
)

from .serializer import (
    SearchKeywordSerializer,
    NaverNewsSerializer,
)
from rest_framework import viewsets


# Create your views here.

class SearchKeywordViewSet(viewsets.ReadOnlyModelViewSet):
    queryset = SearchKeyword.objects.all()
    serializer_class = SearchKeywordSerializer


class NaverNewsViewSet(viewsets.ReadOnlyModelViewSet):
    queryset = NaverNews.objects.all()
    serializer_class = NaverNewsSerializer
