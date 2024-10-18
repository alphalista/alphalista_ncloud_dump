from rest_framework.views import APIView
from rest_framework.response import Response
from rest_framework import status
import requests
from django.conf import settings


class KakaoCallbackAPIView(APIView):
    def post(self, request):
        # POST 요청에서 'code' 파라미터를 받음
        auth_code = request.data.get('code')

        if not auth_code:
            return Response({'error': 'No auth code received'}, status=status.HTTP_400_BAD_REQUEST)

        print(f"Received auth code: {auth_code}")

        # 카카오에 토큰 요청을 위한 API 엔드포인트
        token_url = "https://kauth.kakao.com/oauth/token"

        # 토큰을 요청하기 위한 파라미터
        token_data = {
            'grant_type': 'authorization_code',
            'client_id': settings.KAKAO_REST_API_KEY,
            'redirect_uri': 'http://localhost:3000/auth/login/kakao-callback',
            'code': auth_code,
        }

        # 카카오 API로 POST 요청을 보내 토큰을 받음
        token_response = requests.post(token_url, data=token_data)

        if token_response.status_code == 200:
            token_json = token_response.json()
            access_token = token_json.get('access_token')

            print(f"Access token received: {access_token}")

            return Response({'access_token': access_token}, status=status.HTTP_200_OK)
        else:
            print(
                f"Failed to retrieve token. Status code: {token_response.status_code}, Response: {token_response.text}")
            return Response(
                {'error': 'Failed to retrieve token'},
                status=token_response.status_code
            )

    def get(self, request):
        # GET 요청에서 'code' 파라미터를 받음
        auth_code = request.GET.get('code')

        if not auth_code:
            return Response({'error': 'No auth code received'}, status=status.HTTP_400_BAD_REQUEST)

        print(f"Received auth code via GET: {auth_code}")

        # 여기에 GET 요청을 처리하는 로직을 추가할 수 있습니다.
        return Response({'message': 'GET request received successfully', 'auth_code': auth_code},
                        status=status.HTTP_200_OK)
