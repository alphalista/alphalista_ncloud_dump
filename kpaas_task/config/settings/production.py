from .base import *

DEBUG = True

ALLOWED_HOSTS = ['*']

# 정적 파일 경로 (배포 환경에서 사용)
STATIC_ROOT = os.path.join(BASE_DIR, 'staticfiles')

# 보안 설정
# SECURE_SSL_REDIRECT = True
# SESSION_COOKIE_SECURE = True
# CSRF_COOKIE_SECURE = True
SECURE_BROWSER_XSS_FILTER = True
SECURE_CONTENT_TYPE_NOSNIFF = True
X_FRAME_OPTIONS = 'DENY'

# 데이터베이스 설정, 세부 설정 파일에서 덮어씌워질 수 있음
DATABASES = {
    'default': {
        'ENGINE': 'django.db.backends.mysql',
        'NAME': env('DATABASE_NAME'),
        'USER': env('DATABASE_USER'),
        'PASSWORD': env('DATABASE_PASSWORD'),
        'HOST': env('DATABASE_HOST'),
        'PORT': '3306',
    }
}

# Celery 설정
CELERY_BROKER_URL = env('CELERY_BROKER_URL')
