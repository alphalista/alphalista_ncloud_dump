import 'dart:math';
import 'dart:convert';

class DummyData {
  static String MarketEtBondInquireAskingPrice = '''
  {
    "output": {
      "aspr_acpt_hour": "115305",
      "bond_askp1": "10394.70",
      "bond_askp2": "10394.30",
      "bond_askp3": "10393.90",
      "bond_askp4": "10393.80",
      "bond_askp5": "10393.10",
      "bond_bidp1": "10392.80",
      "bond_bidp2": "10392.60",
      "bond_bidp3": "10392.00",
      "bond_bidp4": "10391.90",
      "bond_bidp5": "10391.30",
      "askp_rsqn1": "12312",
      "askp_rsqn2": "356",
      "askp_rsqn3": "235",
      "askp_rsqn4": "2597",
      "askp_rsqn5": "246263",
      "bidp_rsqn1": "498834",
      "bidp_rsqn2": "65914",
      "bidp_rsqn3": "5770",
      "bidp_rsqn4": "12067",
      "bidp_rsqn5": "9677",
      "total_askp_rsqn": "261763",
      "total_bidp_rsqn": "622262",
      "ntby_aspr_rsqn": "622262",
      "seln_ernn_rate1": "2.571",
      "seln_ernn_rate2": "2.601",
      "seln_ernn_rate3": "3.305",
      "seln_ernn_rate4": "3.488",
      "shnu_ernn_rate3": "3.962",
      "shnu_ernn_rate4": "3.964",
      "shnu_ernn_rate5": "3.981"
    },
    "rt_cd": "0",
    "msg_cd": "MCA00000",
    "msg1": "정상처리 되었습니다."
  }
  ''';

  static String MarketOtcBondInquireAskingPrice = '''
  {
    "output": {
      "aspr_acpt_hour": "115305",
      "bond_askp1": "10026.0",
      "bond_askp2": "10025.0",
      "bond_askp3": "10024.0",
      "bond_askp4": "10023.0",
      "bond_askp5": "10020.0",
      "bond_bidp1": "10019.9",
      "bond_bidp2": "10019.0",
      "bond_bidp3": "10018.9",
      "bond_bidp4": "10018.8",
      "bond_bidp5": "10018.7",
      "askp_rsqn1": "70000",
      "askp_rsqn2": "67000",
      "askp_rsqn3": "25677",
      "askp_rsqn4": "115000",
      "askp_rsqn5": "28945",
      "bidp_rsqn1": "93",
      "bidp_rsqn2": "2200",
      "bidp_rsqn3": "6000",
      "bidp_rsqn4": "200",
      "bidp_rsqn5": "9901",
      "total_askp_rsqn": "731122",
      "total_bidp_rsqn": "422764",
      "ntby_aspr_rsqn": "422764",
      "seln_ernn_rate1": "6.408",
      "seln_ernn_rate2": "6.415",
      "seln_ernn_rate3": "6.422",
      "seln_ernn_rate4": "6.424",
      "shnu_ernn_rate3": "6.450",
      "shnu_ernn_rate4": "6.451",
      "shnu_ernn_rate5": "6.458"
    },
    "rt_cd": "0",
    "msg_cd": "MCA00000",
    "msg1": "정상처리 되었습니다."
  }
  ''';


  static String MarketEtBondInquirePrice = '''
  {
    "output": {
      "stnd_iscd": "KR6145761E43",
      "hts_kor_isnm": "BNK캐피탈351-1",
      "bond_prpr": "10076.00",
      "prdy_vrss_sign": " ",
      "bond_prdy_vrss": "0.00",
      "prdy_ctrt": "0.00",
      "acml_vol": "30239",
      "bond_prdy_clpr": "10076.00",
      "bond_oprc": "3.981",
      "seln_ernn_rate5": "3.981",
      "shnu_ernn_rate1": "3.939",
      "shnu_ernn_rate2": "3.945",
      "bond_hgpr": "10394.70",
      "bond_lwpr": "10391.30",
      "ernn_rate": "3.488",
      "oprc_ert": "3.488",
      "hgpr_ert": "3.981",
      "lwpr_ert": "2.571",
      "bond_mxpr": "10394.70",
      "bond_llam": "7115.50"
    },
    "rt_cd": "0",
    "msg_cd": "MCA00000",
    "msg1": "정상처리 되었습니다."
  }
  ''';

  static String MarketOtcBondInquirePrice = '''
  {
    "output": {
      "stnd_iscd": "KR350114GC54",
      "hts_kor_isnm": "한국전력공사채권1204",
      "bond_prpr": "10018.7",
      "prdy_vrss_sign": " ",
      "bond_prdy_vrss": "0.00",
      "prdy_ctrt": "0.00",
      "acml_vol": "0",
      "bond_prdy_clpr": "10076.00",
      "bond_oprc": "10018.7",
      "seln_ernn_rate5": "3.567",
      "shnu_ernn_rate1": "3.939",
      "shnu_ernn_rate2": "3.945",
      "bond_hgpr": "10026.0",
      "bond_lwpr": "10018.7",
      "ernn_rate": "6.422",
      "oprc_ert": "6.422",
      "hgpr_ert": "6.458",
      "lwpr_ert": "6.408",
      "bond_mxpr": "13213.50",
      "bond_llam": "7115.50"
    },
    "rt_cd": "0",
    "msg_cd": "MCA00000",
    "msg1": "정상처리 되었습니다."
  }
  ''';


  static String MarketBondOtcInquireDailyPrice = '''
     {
    "KR350104GC56": {
        "duration": {
            "week": {
                "duration1": "7.49",
                "duration2": "7.33",
                "duration3": "7.04",
                "duration4": "6.64",
                "duration5": "6.86",
                "duration6": "6.61",
                "duration7": "6.36",
                "duration8": "6.11"
            },
            "month": {
                "duration1": "9.34",
                "duration2": "9.03",
                "duration3": "8.71",
                "duration4": "8.51",
                "duration5": "8.22",
                "duration6": "8.38",
                "duration7": "8.17",
                "duration8": "7.79",
                "duration9": "7.58",
                "duration10": "7.19",
                "duration11": "7.04",
                "duration12": "6.78"
            }
        },
        "price": {
            "week": {
                "price1": "9442",
                "price2": "9433",
                "price3": "9434",
                "price4": "9440",
                "price5": "9393",
                "price6": "9437",
                "price7": "9482",
                "price8": "9465"
            },
            "month": {
                "price1": "11555",
                "price2": "11539",
                "price3": "11495",
                "price4": "11513",
                "price5": "11486",
                "price6": "11494",
                "price7": "11528",
                "price8": "11526",
                "price9": "11501",
                "price10": "11508",
                "price11": "11476",
                "price12": "11500"
            }
        }
    }
}
  ''';
  static String randomBondCodeGenerator() {
    final random = Random();
    String code = "KR";
    for (int i = 0; i < 6; i++) code += random.nextInt(10).toString();
    code += String.fromCharCode(random.nextInt(26) + 65);
    code += random.nextInt(10).toString();
    code += String.fromCharCode(random.nextInt(26) + 65);
    code += random.nextInt(10).toString();
    return code;
  }

  static String MarketEtBondInterestPrice(int count) {
    final random = Random();
    final grades = ["A+", "A", "B+", "B", "CCC"];
    final names = [
      "국고채권01125-3909(19-6)",
      "국고채권01500-5003(20-2)",
      "국민은행채 2년",
      "기업채권 7년",
      "산업은행채 10년",
      "여천NCC84-2",
      "삼척블루파워10",
      "케이디비생명보험12(후)",
      "국고채권03250-4209(22-11)",
      "풀무원 신종자본증권72",
      "푸본현대생명보험27(후)",
      "제이알글로벌위탁관리부동산투자회사2",
      "삼척블루파워11",
      "에스케이어드밴스드14-2",
      "롯데손해보험15(후)",
      "씨제이 씨지브이35CB(신종)",
      "국고채권01375-2912(19-8)",
      "한국토지신탁45-2",
      "두산에너빌리티79-2",
      "유니슨15",
      "SK에코플랜트181-2",
      "대한항공99-2",
      "국고채권01125-2509(20-6)",
      "삼척블루파워7-2",
      "에스엘엘중앙16-2",
      "삼척블루파워9",
      "에이비엘생명보험3(후)",
      "현대건설304-2",
      "키움캐피탈179-3",
      "이수앱지스8CB",
      "국고채권01375-3006(20-4)",
      "케이지모빌리티122",
      "흥국화재해상보험22(후)",
      "한국자산신탁8-1",
      "BNK금융지주 조건부자본증권(상)10",
      "에이치엘디앤아이한라143",
      "롯데손해보험신종자본증권 3",
      "한국전력공사채권1192",
      "우리금융조건부(상)6(신종)",
      "효성화학12"
    ];

    Map<String, dynamic> bonds = {};

    for (int i = 1; i <= count; i++) {
      String kbpGrade = grades[random.nextInt(grades.length)];
      String niceGrade;
      do {
        niceGrade = grades[random.nextInt(grades.length)];
      } while (niceGrade == kbpGrade);

      String nxtmIntDfrmDt = "2024" +
          (11 + random.nextInt(2)).toString().padLeft(2, '0') + // 11월 또는 12월
          (3 + random.nextInt(27)).toString().padLeft(2, '0'); // 3일 이후

      String expdDt = "2024" +
          (11 + random.nextInt(2)).toString().padLeft(2, '0') +
          (20 + random.nextInt(10)).toString().padLeft(2, '0'); // 20일 이후

      bonds[i.toString()] = {
        "prdt_name": names[random.nextInt(names.length)],
        "prdt_nick": "채권" + (i).toString(),
        "code": randomBondCodeGenerator(), // 고정 코드
        "kbp_crdt_grad_text": kbpGrade,
        "nxtm_int_dfrm_dt": nxtmIntDfrmDt,
        "expd_dt": expdDt,
        "expd_asrc_erng_rt":
        ((random.nextDouble() * 10).toStringAsFixed(2)), // -15 ~ 15 사이 수익률
        "nice_crdt_grad_text": niceGrade,
        "total_askp_rsqn": (100 + random.nextInt(9900)).toString(),
        "interest_percentage": ((random.nextDouble() * 10).toStringAsFixed(4)),
        "expt_income": "10${(random.nextInt(900) + 100).toString()}." +
            (random.nextInt(10)).toString(), // 앞 2자리 10 고정, 다섯자리 숫자와 소수점 첫째자리
      };
    }

    return jsonEncode(bonds);
  }


  // static String MarketEtBondTrendingPrice(int count) {
  //   final random = Random();
  //   final bondNames = [
  //     "국민주택1종23-02",
  //     "국민주택1종23-03",
  //     "국민주택1종23-04",
  //     "국민주택1종23-05",
  //     "국민주택1종23-06",
  //     "국민주택1종23-07",
  //     "국민주택1종23-08",
  //     "국민주택1종23-09",
  //     "국민주택1종23-10",
  //     "국민주택1종23-11",
  //     "국민주택1종23-12",
  //     "국민주택1종24-01",
  //     "국민주택1종24-02",
  //     "국민주택1종24-03",
  //     "국민주택1종24-04",
  //     "국민주택1종24-05",
  //     "국민주택1종24-06",
  //     "국민주택1종24-07",
  //     "국민주택1종24-08",
  //     "국민주택1종24-09",
  //     "국민주택1종21-06",
  //     "국민주택1종21-07",
  //     "국민주택1종21-08",
  //     "국민주택1종21-09",
  //     "국민주택1종21-10",
  //     "국민주택1종21-11",
  //     "국민주택1종21-12",
  //     "국민주택1종22-01",
  //     "국민주택1종22-02",
  //     "국민주택1종22-03",
  //     "국민주택1종22-04",
  //     "국민주택1종22-05",
  //     "국민주택1종22-06",
  //     "국민주택1종22-07",
  //     "국민주택1종22-08",
  //     "국민주택1종22-09",
  //     "국민주택1종22-10",
  //     "국민주택1종22-11",
  //     "국민주택1종22-12",
  //     "국민주택1종23-01",
  //     "국민주택1종19-10",
  //     "국민주택1종19-11",
  //     "국민주택1종19-12",
  //     "국민주택1종20-01",
  //     "국민주택1종20-02",
  //     "국민주택1종20-03",
  //     "국민주택1종20-04",
  //     "국민주택1종20-05",
  //     "국민주택1종20-06",
  //     "국민주택1종20-07",
  //     "국민주택1종20-08",
  //     "국민주택1종20-09",
  //     "국민주택1종20-10",
  //     "국민주택1종20-11",
  //     "국민주택1종20-12",
  //     "국민주택1종21-01",
  //     "국민주택1종21-02",
  //     "국민주택1종21-03",
  //     "국민주택1종21-04",
  //     "국민주택1종21-05",
  //   ];

  //   Map<String, dynamic> bonds = {};
  //   for (int i = 1; i <= count; i++) {
  //     final nameIndex = random.nextInt(bondNames.length);
  //     final rate =
  //         (random.nextInt(30) - 15).toDouble(); // -15.0% ~ 15.0% 범위 수익율
  //     final prdtName = "${bondNames[nameIndex]} $i";

  //     bonds["t$i"] = {
  //       "prdt_name": prdtName,
  //       "expd_asrc_erng_rt": "$rate",
  //       "code": "KR101501D9A0",
  //     };
  //   }

  //   return jsonEncode(bonds);
  // }

  static String MarketEtBondAllList = '''
  {
    "count": 16905,
    "next": "http://localhost:8000/api/koreaib/market-bond-code/?limit=20&offset=60",
    "previous": "http://localhost:8000/api/koreaib/market-bond-code/?limit=20&offset=20",
    "results": [
        {
            "id": 41,
            "code": "KR101501DD21",
            "name": "국민주택1종23-02",
            "total_askp_rsqn": "1110",
            "nice_crdt_grad_text": "무위험",
            "issu_dt": "20231217",
            "expd_dt": "20541205",
            "bond_avrg_drtn_val": "6.83",
            "YTM_after_tax": "5.03"
        },
        {
            "id": 42,
            "code": "KR101501DD39",
            "name": "국민주택1종23-03",
            "total_askp_rsqn": "12846",
            "nice_crdt_grad_text": "무위험",
            "issu_dt": "20191120",
            "expd_dt": "20400406",
            "bond_avrg_drtn_val": "15.30",
            "YTM_after_tax": "5.35"
        },
        {
            "id": 43,
            "code": "KR101501DD47",
            "name": "국민주택1종23-04",
            "total_askp_rsqn": "9835",
            "nice_crdt_grad_text": "무위험",
            "issu_dt": "20240902",
            "expd_dt": "20510310",
            "bond_avrg_drtn_val": "3.42",
            "YTM_after_tax": "2.29"
        },
        {
            "id": 44,
            "code": "KR101501DD54",
            "name": "국민주택1종23-05",
            "total_askp_rsqn": "23743",
            "nice_crdt_grad_text": "무위험",
            "issu_dt": "20230726",
            "expd_dt": "20270504",
            "bond_avrg_drtn_val": "1.30",
            "YTM_after_tax": "5.62"
        },
        {
            "id": 45,
            "code": "KR101501DD62",
            "name": "국민주택1종23-06",
            "total_askp_rsqn": "7531",
            "nice_crdt_grad_text": "무위험",
            "issu_dt": "20210225",
            "expd_dt": "20310626",
            "bond_avrg_drtn_val": "6.24",
            "YTM_after_tax": "3.56"
        },
        {
            "id": 46,
            "code": "KR101501DD70",
            "name": "국민주택1종23-07",
            "total_askp_rsqn": "3427",
            "nice_crdt_grad_text": "무위험",
            "issu_dt": "20191207",
            "expd_dt": "20700220",
            "bond_avrg_drtn_val": "31.93",
            "YTM_after_tax": "6.47"
        },
        {
            "id": 47,
            "code": "KR101501DD88",
            "name": "국민주택1종23-08",
            "total_askp_rsqn": "3116",
            "nice_crdt_grad_text": "무위험",
            "issu_dt": "20200404",
            "expd_dt": "20731118",
            "bond_avrg_drtn_val": "32.84",
            "YTM_after_tax": "2.41"
        },
        {
            "id": 48,
            "code": "KR101501DD96",
            "name": "국민주택1종23-09",
            "total_askp_rsqn": "12870",
            "nice_crdt_grad_text": "무위험",
            "issu_dt": "20200909",
            "expd_dt": "20260831",
            "bond_avrg_drtn_val": "1.30",
            "YTM_after_tax": "6.43"
        },
        {
            "id": 49,
            "code": "KR101501DDA1",
            "name": "국민주택1종23-10",
            "total_askp_rsqn": "26676",
            "nice_crdt_grad_text": "무위험",
            "issu_dt": "20190728",
            "expd_dt": "20690515",
            "bond_avrg_drtn_val": "33.07",
            "YTM_after_tax": "3.25"
        },
        {
            "id": 50,
            "code": "KR101501DDB9",
            "name": "국민주택1종23-11",
            "total_askp_rsqn": "28485",
            "nice_crdt_grad_text": "무위험",
            "issu_dt": "20220117",
            "expd_dt": "20750428",
            "bond_avrg_drtn_val": "25.49",
            "YTM_after_tax": "4.47"
        },
        {
            "id": 51,
            "code": "KR101501DDC7",
            "name": "국민주택1종23-12",
            "total_askp_rsqn": "8712",
            "nice_crdt_grad_text": "무위험",
            "issu_dt": "20230101",
            "expd_dt": "20680609",
            "bond_avrg_drtn_val": "25.05",
            "YTM_after_tax": "6.51"
        },
        {
            "id": 52,
            "code": "KR101501DE12",
            "name": "국민주택1종24-01",
            "total_askp_rsqn": "17521",
            "nice_crdt_grad_text": "무위험",
            "issu_dt": "20240528",
            "expd_dt": "20760729",
            "bond_avrg_drtn_val": "40.70",
            "YTM_after_tax": "5.27"
        },
        {
            "id": 53,
            "code": "KR101501DE20",
            "name": "국민주택1종24-02",
            "total_askp_rsqn": "25683",
            "nice_crdt_grad_text": "무위험",
            "issu_dt": "20190403",
            "expd_dt": "20330923",
            "bond_avrg_drtn_val": "7.36",
            "YTM_after_tax": "2.35"
        },
        {
            "id": 54,
            "code": "KR101501DE38",
            "name": "국민주택1종24-03",
            "total_askp_rsqn": "2677",
            "nice_crdt_grad_text": "무위험",
            "issu_dt": "20200522",
            "expd_dt": "20600225",
            "bond_avrg_drtn_val": "20.85",
            "YTM_after_tax": "2.49"
        },
        {
            "id": 55,
            "code": "KR101501DE46",
            "name": "국민주택1종24-04",
            "total_askp_rsqn": "23340",
            "nice_crdt_grad_text": "무위험",
            "issu_dt": "20231202",
            "expd_dt": "20650308",
            "bond_avrg_drtn_val": "39.32",
            "YTM_after_tax": "3.29"
        },
        {
            "id": 56,
            "code": "KR101501DE53",
            "name": "국민주택1종24-05",
            "total_askp_rsqn": "1080",
            "nice_crdt_grad_text": "무위험",
            "issu_dt": "20240109",
            "expd_dt": "20410503",
            "bond_avrg_drtn_val": "12.58",
            "YTM_after_tax": "6.91"
        },
        {
            "id": 57,
            "code": "KR101501DE61",
            "name": "국민주택1종24-06",
            "total_askp_rsqn": "8466",
            "nice_crdt_grad_text": "무위험",
            "issu_dt": "20240425",
            "expd_dt": "20671226",
            "bond_avrg_drtn_val": "10.49",
            "YTM_after_tax": "5.42"
        },
        {
            "id": 58,
            "code": "KR101501DE79",
            "name": "국민주택1종24-07",
            "total_askp_rsqn": "8495",
            "nice_crdt_grad_text": "무위험",
            "issu_dt": "20240915",
            "expd_dt": "20250630",
            "bond_avrg_drtn_val": "0.42",
            "YTM_after_tax": "6.06"
        },
        {
            "id": 59,
            "code": "KR101501DE87",
            "name": "국민주택1종24-08",
            "total_askp_rsqn": "11964",
            "nice_crdt_grad_text": "무위험",
            "issu_dt": "20220814",
            "expd_dt": "20451127",
            "bond_avrg_drtn_val": "5.24",
            "YTM_after_tax": "5.65"
        },
        {
            "id": 60,
            "code": "KR101501DE95",
            "name": "국민주택1종24-09",
            "total_askp_rsqn": "22638",
            "nice_crdt_grad_text": "무위험",
            "issu_dt": "20200416",
            "expd_dt": "20580415",
            "bond_avrg_drtn_val": "5.48",
            "YTM_after_tax": "5.96"
        }
    ]
}
''';

  static String MarketOtcBondAllList = '''
{
    "count": 16905,
    "next": "http://localhost:8000/api/koreaib/market-bond-code/?limit=20&offset=60",
    "previous": "http://localhost:8000/api/koreaib/market-bond-code/?limit=20&offset=20",
    "results": [
        {
            "issu_istt_name": "미래에셋 증권",
            "code": "KR6145761E43",
            "prdt_name": "BNK캐피탈351-1",
            "nice_crdt_grad_text": "낮은위험",
            "issu_dt": "20240408",
            "expd_dt": "20250408",
            "YTM": "3.32",
            "YTM_after_tax": "2.81",
            "price_per_10": "10038",
            "prdt_type_cd": "일반회사채",
            "bond_int_dfrm_mthd_cd": "이표채",
            "int_pay_cycle": "3 ",
            "interest_percentage": "4.1000",
            "nxtm_int_dfrm_dt": "20250108",
            "expt_income": "10173.43",
            "duration": "0.43"
        },
        {
            "issu_istt_name": "미래에셋 증권",
            "code": "KR350114GC54",
            "prdt_name": "한국전력공사채권1204",
            "nice_crdt_grad_text": "매우낮은위험",
            "issu_dt": "20220524",
            "expd_dt": "20250524",
            "YTM": "3.11",
            "YTM_after_tax": "2.63",
            "price_per_10": "10180",
            "prdt_type_cd": "할부금융채",
            "bond_int_dfrm_mthd_cd": "이표채",
            "int_pay_cycle": "3 ",
            "interest_percentage": "4.6300",
            "nxtm_int_dfrm_dt": "20241124",
            "expt_income": "10293.77",
            "duration": "0.48"
        },
        {
            "issu_istt_name": "미래에셋 증권",
            "code": "KR350114GC54",
            "prdt_name": "한국전력공사채권1204",
            "nice_crdt_grad_text": "매우낮은위험",
            "issu_dt": "20220524",
            "expd_dt": "20250524",
            "YTM": "3.11",
            "YTM_after_tax": "2.63",
            "price_per_10": "10180",
            "prdt_type_cd": "금융지주회사채",
            "bond_int_dfrm_mthd_cd": "이표채",
            "int_pay_cycle": "3 ",
            "interest_percentage": "4.0000",
            "nxtm_int_dfrm_dt": "20241124",
            "expt_income": "10253.8",
            "duration": "0.1"
        },
        {
            "issu_istt_name": "미래에셋 증권",
            "code": "KR350114GC54",
            "prdt_name": "한국전력공사채권1204",
            "nice_crdt_grad_text": "매우낮은위험",
            "issu_dt": "20220524",
            "expd_dt": "20250524",
            "YTM": "3.11",
            "YTM_after_tax": "2.63",
            "price_per_10": "10180",
            "prdt_type_cd": "금융지주회사채",
            "bond_int_dfrm_mthd_cd": "이표채",
            "int_pay_cycle": "3 ",
            "interest_percentage": "4.0000",
            "nxtm_int_dfrm_dt": "20241124",
            "expt_income": "10253.8",
            "duration": "0.44"
        },
        {
            "issu_istt_name": "미래에셋 증권",
            "code": "KR350114GC54",
            "prdt_name": "한국전력공사채권1204",
            "nice_crdt_grad_text": "매우낮은위험",
            "issu_dt": "20220524",
            "expd_dt": "20250524",
            "YTM": "3.11",
            "YTM_after_tax": "2.63",
            "price_per_10": "10180",
            "prdt_type_cd": "일반회사채",
            "bond_int_dfrm_mthd_cd": "이표채",
            "int_pay_cycle": "3 ",
            "interest_percentage": "1.6320",
            "nxtm_int_dfrm_dt": "20241124",
            "expt_income": "10103.55",
            "duration": "0.33"
        },
        {
            "issu_istt_name": "미래에셋 증권",
            "code": "KR350114GC54",
            "prdt_name": "한국전력공사채권1204",
            "nice_crdt_grad_text": "매우낮은위험",
            "issu_dt": "20220524",
            "expd_dt": "20250524",
            "YTM": "3.11",
            "YTM_after_tax": "2.63",
            "price_per_10": "10180",
            "prdt_type_cd": "국고채권",
            "bond_int_dfrm_mthd_cd": "이표채",
            "int_pay_cycle": "6 ",
            "interest_percentage": "1.1250",
            "nxtm_int_dfrm_dt": "20241124",
            "expt_income": "10095.17",
            "duration": "0.23"
        },
        {
            "issu_istt_name": "미래에셋 증권",
            "code": "KR350114GC54",
            "prdt_name": "한국전력공사채권1204",
            "nice_crdt_grad_text": "매우낮은위험",
            "issu_dt": "20220524",
            "expd_dt": "20250524",
            "YTM": "3.11",
            "YTM_after_tax": "2.63",
            "price_per_10": "10180",
            "prdt_type_cd": "금융지주회사채",
            "bond_int_dfrm_mthd_cd": "이표채",
            "int_pay_cycle": "3 ",
            "interest_percentage": "3.9500",
            "nxtm_int_dfrm_dt": "20241124",
            "expt_income": "10250.63",
            "duration": "0.08"
        },
        {
            "issu_istt_name": "미래에셋 증권",
            "code": "KR350114GC54",
            "prdt_name": "한국전력공사채권1204",
            "nice_crdt_grad_text": "매우낮은위험",
            "issu_dt": "20220524",
            "expd_dt": "20250524",
            "YTM": "3.11",
            "YTM_after_tax": "2.63",
            "price_per_10": "10180",
            "prdt_type_cd": "일반회사채",
            "bond_int_dfrm_mthd_cd": "이표채",
            "int_pay_cycle": "3 ",
            "interest_percentage": "1.6900",
            "nxtm_int_dfrm_dt": "20241124",
            "expt_income": "10107.23",
            "duration": "0.44"
        },
        {
            "issu_istt_name": "미래에셋 증권",
            "code": "KR350114GC54",
            "prdt_name": "한국전력공사채권1204",
            "nice_crdt_grad_text": "매우낮은위험",
            "issu_dt": "20220524",
            "expd_dt": "20250524",
            "YTM": "3.11",
            "YTM_after_tax": "2.63",
            "price_per_10": "10180",
            "prdt_type_cd": "도시철도공채",
            "bond_int_dfrm_mthd_cd": "복리채",
            "int_pay_cycle": "12 ",
            "interest_percentage": "2.5000",
            "nxtm_int_dfrm_dt": "20250524",
            "expt_income": "10211.5",
            "duration": "0.57"
        },
        {
            "issu_istt_name": "미래에셋 증권",
            "code": "KR350104GC56",
            "prdt_name": "한국전력공사채권 1194",
            "nice_crdt_grad_text": "매우낮은위험",
            "issu_dt": "20220504",
            "expd_dt": "20250504",
            "YTM": "3.10",
            "YTM_after_tax": "2.62",
            "price_per_10": "10209",
            "prdt_type_cd": "지역개발채",
            "bond_int_dfrm_mthd_cd": "복리채",
            "int_pay_cycle": "12 ",
            "interest_percentage": "1.0500",
            "nxtm_int_dfrm_dt": "20250504",
            "expt_income": "10088.83",
            "duration": "0.4"
        },
        {
            "issu_istt_name": "미래에셋 증권",
            "code": "KR350104GC56",
            "prdt_name": "한국전력공사채권 1194",
            "nice_crdt_grad_text": "매우낮은위험",
            "issu_dt": "20220504",
            "expd_dt": "20250504",
            "YTM": "3.10",
            "YTM_after_tax": "2.62",
            "price_per_10": "10209",
            "prdt_type_cd": "지역개발채",
            "bond_int_dfrm_mthd_cd": "복리채",
            "int_pay_cycle": "12 ",
            "interest_percentage": "1.0500",
            "nxtm_int_dfrm_dt": "20250504",
            "expt_income": "10088.83",
            "duration": "0.08"
        },
        {
            "issu_istt_name": "미래에셋 증권",
            "code": "KR350104GC56",
            "prdt_name": "한국전력공사채권 1194",
            "nice_crdt_grad_text": "매우낮은위험",
            "issu_dt": "20220504",
            "expd_dt": "20250504",
            "YTM": "3.10",
            "YTM_after_tax": "2.62",
            "price_per_10": "10209",
            "prdt_type_cd": "금융지주회사채",
            "bond_int_dfrm_mthd_cd": "이표채",
            "int_pay_cycle": "3 ",
            "interest_percentage": "4.0000",
            "nxtm_int_dfrm_dt": "20241104",
            "expt_income": "10253.8",
            "duration": "0.2"
        },
        {
            "issu_istt_name": "미래에셋 증권",
            "code": "KR350104GC56",
            "prdt_name": "한국전력공사채권 1194",
            "nice_crdt_grad_text": "매우낮은위험",
            "issu_dt": "20220504",
            "expd_dt": "20250504",
            "YTM": "3.10",
            "YTM_after_tax": "2.62",
            "price_per_10": "10209",
            "prdt_type_cd": "일반회사채",
            "bond_int_dfrm_mthd_cd": "이표채",
            "int_pay_cycle": "3 ",
            "interest_percentage": "1.5650",
            "nxtm_int_dfrm_dt": "20241104",
            "expt_income": "10099.3",
            "duration": "0.31"
        },
        {
            "issu_istt_name": "미래에셋 증권",
            "code": "KR6029882E43",
            "prdt_name": "현대캐피탈2015-2(녹)",
            "nice_crdt_grad_text": "낮은위험",
            "issu_dt": "20240408",
            "expd_dt": "20270408",
            "YTM": "3.08",
            "YTM_after_tax": "2.61",
            "price_per_10": "10139",
            "prdt_type_cd": "지역개발채",
            "bond_int_dfrm_mthd_cd": "복리채",
            "int_pay_cycle": "12 ",
            "interest_percentage": "1.0500",
            "nxtm_int_dfrm_dt": "20250408",
            "expt_income": "10266.49",
            "duration": "1.5"
        },
        {
            "issu_istt_name": "미래에셋 증권",
            "code": "KR6029882E43",
            "prdt_name": "현대캐피탈2015-2(녹)",
            "nice_crdt_grad_text": "낮은위험",
            "issu_dt": "20240408",
            "expd_dt": "20270408",
            "YTM": "3.08",
            "YTM_after_tax": "2.61",
            "price_per_10": "10139",
            "prdt_type_cd": "국민주택1종",
            "bond_int_dfrm_mthd_cd": "복리채",
            "int_pay_cycle": "12 ",
            "interest_percentage": "1.3000",
            "nxtm_int_dfrm_dt": "20250408",
            "expt_income": "10329.94",
            "duration": "2.1"
        },
        {
            "issu_istt_name": "미래에셋 증권",
            "code": "KR6029882E43",
            "prdt_name": "현대캐피탈2015-2(녹)",
            "nice_crdt_grad_text": "낮은위험",
            "issu_dt": "20240408",
            "expd_dt": "20270408",
            "YTM": "3.08",
            "YTM_after_tax": "2.61",
            "price_per_10": "10139",
            "prdt_type_cd": "일반회사채",
            "bond_int_dfrm_mthd_cd": "이표채",
            "int_pay_cycle": "3 ",
            "interest_percentage": "3.7030",
            "nxtm_int_dfrm_dt": "20250108",
            "expt_income": "10783.18",
            "duration": "0.69"
        },
        {
            "issu_istt_name": "미래에셋 증권",
            "code": "KR6029882E43",
            "prdt_name": "현대캐피탈2015-2(녹)",
            "nice_crdt_grad_text": "낮은위험",
            "issu_dt": "20240408",
            "expd_dt": "20270408",
            "YTM": "3.08",
            "YTM_after_tax": "2.61",
            "price_per_10": "10139",
            "prdt_type_cd": "지역개발채",
            "bond_int_dfrm_mthd_cd": "복리채",
            "int_pay_cycle": "12 ",
            "interest_percentage": "1.0500",
            "nxtm_int_dfrm_dt": "20250408",
            "expt_income": "10266.49",
            "duration": "0.02"
        },
        {
            "issu_istt_name": "미래에셋 증권",
            "code": "KR6029272D91",
            "prdt_name": "에스케이실트론49-2",
            "nice_crdt_grad_text": "보통위험",
            "issu_dt": "20230906",
            "expd_dt": "20260904",
            "YTM": "3.05",
            "YTM_after_tax": "2.58",
            "price_per_10": "10371",
            "prdt_type_cd": "국고채권",
            "bond_int_dfrm_mthd_cd": "이표채",
            "int_pay_cycle": "6 ",
            "interest_percentage": "1.3750",
            "nxtm_int_dfrm_dt": "20250306",
            "expt_income": "10232.65",
            "duration": "1.77"
        },
        {
            "issu_istt_name": "미래에셋 증권",
            "code": "KR6029272D91",
            "prdt_name": "에스케이실트론49-2",
            "nice_crdt_grad_text": "보통위험",
            "issu_dt": "20230906",
            "expd_dt": "20260904",
            "YTM": "3.05",
            "YTM_after_tax": "2.58",
            "price_per_10": "10371",
            "prdt_type_cd": "일반특수법인채",
            "bond_int_dfrm_mthd_cd": "이표채",
            "int_pay_cycle": "3 ",
            "interest_percentage": "1.4430",
            "nxtm_int_dfrm_dt": "20241206",
            "expt_income": "10244.16",
            "duration": "1.85"
        },
        {
            "issu_istt_name": "미래에셋 증권",
            "code": "KR6029272D91",
            "prdt_name": "에스케이실트론49-2",
            "nice_crdt_grad_text": "보통위험",
            "issu_dt": "20230906",
            "expd_dt": "20260904",
            "YTM": "3.05",
            "YTM_after_tax": "2.58",
            "price_per_10": "10371",
            "prdt_type_cd": "지역개발채",
            "bond_int_dfrm_mthd_cd": "복리채",
            "int_pay_cycle": "12 ",
            "interest_percentage": "2.5000",
            "nxtm_int_dfrm_dt": "20250906",
            "expt_income": "10423.0",
            "duration": "0.33"
        }
    ]
}
''';

  static String MarketOtcBondInterestPrice = '''
[
  {
    "issu_istt_name": "미래에셋 증권",
    "code": "KR6145761E43",
    "prdt_name": "BNK캐피탈351-1",
    "nice_crdt_grad_text": "낮은위험",
    "issu_dt": "20240408",
    "expd_dt": "20250408",
    "YTM": "3.32",
    "YTM_after_tax": "2.81",
    "price_per_10": "10038",
    "prdt_type_cd": "일반회사채",
    "bond_int_dfrm_mthd_cd": "이표채",
    "int_pay_cycle": "3 ",
    "interest_percentage": "4.1000",
    "nxtm_int_dfrm_dt": "20250108",
    "expt_income": "10173.43",
    "duration": "0.08",
    "prdt_nick": "장외 채권 별명1"
  },
  {
    "issu_istt_name": "미래에셋 증권",
    "code": "KR350114GC54",
    "prdt_name": "한국전력공사채권1204",
    "nice_crdt_grad_text": "매우낮은위험",
    "issu_dt": "20220524",
    "expd_dt": "20250524",
    "YTM": "3.11",
    "YTM_after_tax": "2.63",
    "price_per_10": "10180",
    "prdt_type_cd": "금융지주회사채",
    "bond_int_dfrm_mthd_cd": "이표채",
    "int_pay_cycle": "3 ",
    "interest_percentage": "4.0000",
    "nxtm_int_dfrm_dt": "20241124",
    "expt_income": "10253.8",
    "duration": "0.49",
    "prdt_nick": "장외 채권 별명3"
  },
  {
    "issu_istt_name": "미래에셋 증권",
    "code": "KR350104GC56",
    "prdt_name": "한국전력공사채권 1194",
    "nice_crdt_grad_text": "매우낮은위험",
    "issu_dt": "20220504",
    "expd_dt": "20250504",
    "YTM": "3.10",
    "YTM_after_tax": "2.62",
    "price_per_10": "10209",
    "prdt_type_cd": "금융지주회사채",
    "bond_int_dfrm_mthd_cd": "이표채",
    "int_pay_cycle": "3 ",
    "interest_percentage": "4.0000",
    "nxtm_int_dfrm_dt": "20241104",
    "expt_income": "10253.8",
    "duration": "0.18",
    "prdt_nick": "장외 채권 별명12"
  },
  {
    "issu_istt_name": "미래에셋 증권",
    "code": "KR6029882E43",
    "prdt_name": "현대캐피탈2015-2(녹)",
    "nice_crdt_grad_text": "낮은위험",
    "issu_dt": "20240408",
    "expd_dt": "20270408",
    "YTM": "3.08",
    "YTM_after_tax": "2.61",
    "price_per_10": "10139",
    "prdt_type_cd": "지역개발채",
    "bond_int_dfrm_mthd_cd": "복리채",
    "int_pay_cycle": "12 ",
    "interest_percentage": "1.0500",
    "nxtm_int_dfrm_dt": "20250408",
    "expt_income": "10266.49",
    "duration": "0.12",
    "prdt_nick": "장외 채권 별명14"
  },
  {
    "issu_istt_name": "미래에셋 증권",
    "code": "KR6029272D91",
    "prdt_name": "에스케이실트론49-2",
    "nice_crdt_grad_text": "보통위험",
    "issu_dt": "20230906",
    "expd_dt": "20260904",
    "YTM": "3.05",
    "YTM_after_tax": "2.58",
    "price_per_10": "10371",
    "prdt_type_cd": "국고채권",
    "bond_int_dfrm_mthd_cd": "이표채",
    "int_pay_cycle": "6 ",
    "interest_percentage": "1.3750",
    "nxtm_int_dfrm_dt": "20250306",
    "expt_income": "10232.65",
    "duration": "1.55",
    "prdt_nick": "장외 채권 별명18"
  },
  {
    "issu_istt_name": "미래에셋 증권",
    "code": "KR6029272D91",
    "prdt_name": "에스케이실트론49-2",
    "nice_crdt_grad_text": "보통위험",
    "issu_dt": "20230906",
    "expd_dt": "20260904",
    "YTM": "3.05",
    "YTM_after_tax": "2.58",
    "price_per_10": "10371",
    "prdt_type_cd": "일반특수법인채",
    "bond_int_dfrm_mthd_cd": "이표채",
    "int_pay_cycle": "3 ",
    "interest_percentage": "1.4430",
    "nxtm_int_dfrm_dt": "20241206",
    "expt_income": "10244.16",
    "duration": "1.0",
    "prdt_nick": "장외 채권 별명19"
  }
]
  ''';

  static String MarketOtcBondTrendingPrice = '''
{
    "t1": {
        "prdt_name": "에스케이실트론49-2",
        "code": "KR101501D9A0",
        "expd_asrc_erng_rt": "6.51"
    },
    "t2": {
        "prdt_name": "현대캐피탈2015-2(녹)",
        "code": "KR101501D9A0",
        "expd_asrc_erng_rt": "1.42"
    },
    "t3": {
        "prdt_name": "한국전력공사채권1204",
        "code": "KR101501D9A0",
        "expd_asrc_erng_rt": "3.25"
    },
    "t4": {
        "prdt_name": "한국도로공사고속도로건설채권727",
        "code": "KR101501D9A0",
        "expd_asrc_erng_rt": "4.03"
    },
    "t5": {
        "prdt_name": "한국수자원공사258",
        "code": "KR101501D9A0",
        "expd_asrc_erng_rt": "2.75"
    },
    "t6": {
        "prdt_name": "한국자산관리공사채권제47회5012-07",
        "code": "KR101501D9A0",
        "expd_asrc_erng_rt": "1.4"
    },
    "t7": {
        "prdt_name": "토지주택채권(용지)22-09",
        "code": "KR101501D9A0",
        "expd_asrc_erng_rt": "1.05"
    },
    "t8": {
        "prdt_name": "스탠다드차타드은행(이중상환)2020-0001",
        "code": "KR101501D9A0",
        "expd_asrc_erng_rt": "4.04"
    },
    "t9": {
        "prdt_name": "NH농협금융지주29-2",
        "code": "KR101501D9A0",
        "expd_asrc_erng_rt": "5.93"
    },
    "t10": {
        "prdt_name": "토지주택채권(용지)23-09",
        "code": "KR101501D9A0",
        "expd_asrc_erng_rt": "2.31"
    },
    "t11": {
        "prdt_name": "산업금융채권21신이0400-0909-2",
        "code": "KR101501D9A0",
        "expd_asrc_erng_rt": "2.96"
    },
    "t12": {
        "prdt_name": "서울도시철도공채증권19-06",
        "code": "KR101501D9A0",
        "expd_asrc_erng_rt": "1.25"
    },
    "t13": {
        "prdt_name": "국고채권01125-3909(19-6)",
        "code": "KR101501D9A0",
        "expd_asrc_erng_rt": "2.72"
    },
    "t14": {
        "prdt_name": "국고채권03375-3206(22-5)",
        "code": "KR101501D9A0",
        "expd_asrc_erng_rt": "5.35"
    },
    "t15": {
        "prdt_name": "국민주택1종채권20-11",
        "code": "KR101501D9A0",
        "expd_asrc_erng_rt": "3.93"
    }
}
  ''';

  static String MarketEtBondTrendingPrice = '''
{
    "t1": {
        "prdt_name": "AJ네트웍스70-2",
        "code": "KR6095572E23",
        "expd_asrc_erng_rt": "6.39"
    },
    "t2": {
        "prdt_name": "BNK금융지주 조건부자본증권(상)1-2",
        "code": "KR6138934569",
        "expd_asrc_erng_rt": "2.33"
    },
    "t3": {
        "prdt_name": "한국전력공사채권1204",
        "code": "KR101501D9A0",
        "expd_asrc_erng_rt": "5.8"
    },
    "t4": {
        "prdt_name": "BNK캐피탈197-2",
        "code": "KR614576DA18",
        "expd_asrc_erng_rt": "6.52"
    },
    "t5": {
        "prdt_name": "DB손해보험2(후)",
        "code": "KR6005831B63",
        "expd_asrc_erng_rt": "4.29"
    },
    "t6": {
        "prdt_name": "DGB금융지주 조건부자본증권(상)2(신종-영",
        "code": "KR6139131A27",
        "expd_asrc_erng_rt": "3.63"
    },
    "t7": {
        "prdt_name": "DL에너지11-1",
        "code": "KR6220031E63",
        "expd_asrc_erng_rt": "1.58"
    },
    "t8": {
        "prdt_name": "GS건설144-2",
        "code": "KR6006362E65",
        "expd_asrc_erng_rt": "4.58"
    },
    "t9": {
        "prdt_name": "GS파워11-1",
        "code": "KR6047801D28",
        "expd_asrc_erng_rt": "2.89"
    },
    "t10": {
        "prdt_name": "HDC현대산업개발3-3",
        "code": "KR6294873A71",
        "expd_asrc_erng_rt": "5.67"
    },
    "t11": {
        "prdt_name": "HD현대8-2",
        "code": "KR6267252BA3",
        "expd_asrc_erng_rt": "1.78"
    },
    "t12": {
        "prdt_name": "HD현대건설기계12-1",
        "code": "KR6267271D56",
        "expd_asrc_erng_rt": "1.29"
    },
    "t13": {
        "prdt_name": "HD현대인프라코어81-2",
        "code": "KR6042672E32",
        "expd_asrc_erng_rt": "5.39"
    },
    "t14": {
        "prdt_name": "JB 우리캐피탈417-6",
        "code": "KR6079316B21",
        "expd_asrc_erng_rt": "4.65"
    },
    "t15": {
        "prdt_name": "HD현대일렉트릭11-1",
        "code": "KR6267261E40",
        "expd_asrc_erng_rt": "4.57"
    }
}
  ''';

  static String MarketEtBondOwningPrice = '''
{
    "t1": {
        "prdt_name": "AJ네트웍스70-2",
    },
    "t2": {
        "prdt_name": "BNK금융지주 조건부자본증권(상)1-2",
    },
    "t3": {
        "prdt_name": "한국전력공사채권1204",
    },
    "t4": {
        "prdt_name": "BNK캐피탈197-2",
    }
}
  ''';

  static String MarketOtcBondOwningPrice = '''
{
    "t1": {
        "prdt_name": "AJ네트웍스70-2",
    },
    "t2": {
        "prdt_name": "BNK금융지주 조건부자본증권(상)1-2",
    }
}
  ''';
}
