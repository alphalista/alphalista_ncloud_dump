from .base import *

DEBUG = True

ALLOWED_HOSTS = ['*']

# 개발용 Static 파일 경로
STATICFILES_DIRS = [os.path.join(BASE_DIR, 'static')]

# 데이터베이스 설정, 세부 설정 파일에서 덮어씌워질 수 있음
DATABASES = {
    'default': {
        'ENGINE': 'django.db.backends.mysql',
        'NAME': env('DATABASE_NAME_DEV'),
        'USER': env('DATABASE_USER_DEV'),
        'PASSWORD': env('DATABASE_PASSWORD_DEV'),
        'HOST': env('DATABASE_HOST_DEV'),
        'PORT': '3306',
    }
}

# Celery 설정
CELERY_BROKER_URL = env('CELERY_BROKER_URL')
CELERY_WORKER_POOL = 'solo'  # 윈도우 에러 해결
