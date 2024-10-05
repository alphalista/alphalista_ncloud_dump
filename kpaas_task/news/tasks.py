# Create your tasks here

from .models import (
    SearchKeyword,
    NaverNews,
)

from celery import shared_task