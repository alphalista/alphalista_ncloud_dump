## Crawling 개요
- 아래와 같은 python dictionary 형태로 받아오게 됩니다.
``` JSON
{
    'trading_company_name': '미래에셋 증권',
    'bond_code': 'KR2006022C97',
    'bond_name': '부산지역개발채권 22-09', 
    'danger_degree': '매우낮은위험',
    'pub_date': '2022.09.30',
    'mat_date': '2027.09.30',
    'YTM': '3.49',
    'YTM_after_tax': '2.95',
    'price_per_10': '9642',
    'bond_type': '지역개발채',
    'int_pay_class': '복리채',
    'int_pay_cycle': '12 ',
    'interest_percentage': '1.0500',
    'nxt_int_date': '2025.09.30',
    'expt_income': '10266.49'
    'duration': 'NONE'
}
```
1. trading_company_name: 중개 증권사 이름
2. bond_code: 채권 코드
3. bond_name: 채권 명
4. danger_degree: 투자(채권) 위험도
5. pub_date: 발행일
6. mat_date: 만기일
7. YTM: 세전 수익률
8. YTM_after_tax: 세후 수익률
9. price_per_10: 수량 단위 천원으로 잡았을 때 수량 10개 단위 가격
10. bond_type: 채권 종류
11. int_pay_class: 이자 지급 구분
12. int_pay_cycle: 이자 지급 주기
13. interest_percentage: 이자율
14. nxt_int_date: 차기 이자 지급일
15. expt_income: 원금 포함 예상 수익금
16. duration: 듀레이션 (계산)


## NOTE
- 현재 크롤링 완료한 증권사는 미래에셋, 신한, 대신증권
## TODO
1. DB에 인스턴스가 중복으로 들어오는 오류 수정. (크롤링 과정에서 중복 제거가 필요해보임, 미래에셋 증권 크롤링과정에서 발생, 다른 증권사의 경우 확인 필요)
2. duration을 계산하여 DB에 저장 (현재 Duration의 값은 NONE으로 저장되고 있는 상태)
3. 2번의 경우 듀레이션 알고리즘이 완성되는대로 구현

## venv 구성
- pip install scrapy
- pip install scrapy-splash
- pip install mysql-connector-python