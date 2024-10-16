class DummyData {
  static String MarketBondInquireAskingPrice = '''
  {
    "output": {
      "aspr_acpt_hour": "115305",
      "bond_askp1": "0.00",
      "bond_askp2": "0.00",
      "bond_askp3": "0.00",
      "bond_askp4": "0.00",
      "bond_askp5": "0.00",
      "bond_bidp1": "10392.80",
      "bond_bidp2": "10392.60",
      "bond_bidp3": "10392.00",
      "bond_bidp4": "10391.90",
      "bond_bidp5": "10391.30",
      "askp_rsqn1": "0",
      "askp_rsqn2": "0",
      "askp_rsqn3": "0",
      "askp_rsqn4": "0",
      "askp_rsqn5": "0",
      "bidp_rsqn1": "498834",
      "bidp_rsqn2": "65914",
      "bidp_rsqn3": "5770",
      "bidp_rsqn4": "12067",
      "bidp_rsqn5": "9677",
      "total_askp_rsqn": "0",
      "total_bidp_rsqn": "622262",
      "ntby_aspr_rsqn": "622262",
      "seln_ernn_rate1": "0.000",
      "seln_ernn_rate2": "0.000",
      "seln_ernn_rate3": "0.000",
      "seln_ernn_rate4": "0.000",
      "shnu_ernn_rate3": "3.962",
      "shnu_ernn_rate4": "3.964",
      "shnu_ernn_rate5": "3.981"
    },
    "rt_cd": "0",
    "msg_cd": "MCA00000",
    "msg1": "정상처리 되었습니다."
  }
  ''';

  static String MarketBondInquirePrice = '''
  {
    "output": {
      "stnd_iscd": "KR2033022D33",
      "hts_kor_isnm": "충북지역개발23-03",
      "bond_prpr": "10076.00",
      "prdy_vrss_sign": " ",
      "bond_prdy_vrss": "0.00",
      "prdy_ctrt": "0.00",
      "acml_vol": "0",
      "bond_prdy_clpr": "10076.00",
      "bond_oprc": "0.00",
      "seln_ernn_rate5": "0.000",
      "shnu_ernn_rate1": "3.939",
      "shnu_ernn_rate2": "3.945",
      "bond_hgpr": "0.00",
      "bond_lwpr": "0.00",
      "ernn_rate": "0.000",
      "oprc_ert": "0.000",
      "hgpr_ert": "0.000",
      "lwpr_ert": "0.000",
      "bond_mxpr": "13213.50",
      "bond_llam": "7115.50"
    },
    "rt_cd": "0",
    "msg_cd": "MCA00000",
    "msg1": "정상처리 되었습니다."
  }
  ''';

  static String MarketBondInquireDailyPrice = '''
     {
    "output": [
        {
            "stck_bsop_date": "20241011",
            "bond_oprc": "0.00",
            "bond_hgpr": "10186.00",
            "bond_lwpr": "9986.00",
            "bond_prpr": "10086.00",
            "acml_vol": "0"
        },
        {
            "stck_bsop_date": "20241010",
            "bond_oprc": "10076.00",
            "bond_hgpr": "10176.00",
            "bond_lwpr": "9976.00",
            "bond_prpr": "10076.00",
            "acml_vol": "3298"
        },
        {
            "stck_bsop_date": "20241008",
            "bond_oprc": "10082.50",
            "bond_hgpr": "10182.50",
            "bond_lwpr": "9982.50",
            "bond_prpr": "10082.50",
            "acml_vol": "47"
        },
        {
            "stck_bsop_date": "20241007",
            "bond_oprc": "9281.00",
            "bond_hgpr": "9381.00",
            "bond_lwpr": "9181.00",
            "bond_prpr": "9281.00",
            "acml_vol": "47"
        },
        {
            "stck_bsop_date": "20241004",
            "bond_oprc": "9490.00",
            "bond_hgpr": "9590.00",
            "bond_lwpr": "9390.00",
            "bond_prpr": "9490.00",
            "acml_vol": "100000"
        },
        {
            "stck_bsop_date": "20241002",
            "bond_oprc": "9411.00",
            "bond_hgpr": "9511.00",
            "bond_lwpr": "9311.00",
            "bond_prpr": "9411.00",
            "acml_vol": "200000"
        },
        {
            "stck_bsop_date": "20240930",
            "bond_oprc": "9350.00",
            "bond_hgpr": "9450.00",
            "bond_lwpr": "9250.00",
            "bond_prpr": "9350.00",
            "acml_vol": "100000"
        },
        {
            "stck_bsop_date": "20240927",
            "bond_oprc": "9212.50",
            "bond_hgpr": "9312.50",
            "bond_lwpr": "9112.50",
            "bond_prpr": "9212.50",
            "acml_vol": "100000"
        }
    ],
    "rt_cd": "0",
    "msg_cd": "MCA00000",
    "msg1": "정상처리 되었습니다."
}
  ''';

  static String MarketEtBondInterestPrice = '''
  {
    "1": {
        "prdt_name": "관심 장내 채권 1",
        "prdt_nick": "장내 1",
        "code": "KR101501D9A0",
        "kbp_crdt_grad_text": "A+",
        "nxtm_int_dfrm_dt": "20241020",
        "expd_dt": "20241027",
        "expd_asrc_erng_rt": "1.0%",
        "nice_crdt_grad_text": "A+",
        "total_askp_rsqn": "123"
    },
    "2": {
        "prdt_name": "관심 장내 채권 2",
        "prdt_nick": "장내 2",
        "code": "KR101501D9A0",
        "kbp_crdt_grad_text": "A",
        "nxtm_int_dfrm_dt": "20241021",
        "expd_dt": "20241028",
        "expd_asrc_erng_rt": "-2.0%",
        "nice_crdt_grad_text": "A",
        "total_askp_rsqn": "234"
    },
    "3": {
        "prdt_name": "관심 장내 채권 3",
        "prdt_nick": "장내 3",
        "code": "KR101501D9A0",
        "kbp_crdt_grad_text": "B+",
        "nxtm_int_dfrm_dt": "20241022",
        "expd_dt": "20241029",
        "expd_asrc_erng_rt": "3.0%",
        "nice_crdt_grad_text": "B+",
        "total_askp_rsqn": "345"
    },
    "4": {
        "prdt_name": "관심 장내 채권 4",
        "prdt_nick": "장내 4",
        "code": "KR101501D9A0",
        "kbp_crdt_grad_text": "B",
        "nxtm_int_dfrm_dt": "20241023",
        "expd_dt": "20241030",
        "expd_asrc_erng_rt": "-4.0%",
        "nice_crdt_grad_text": "B",
        "total_askp_rsqn": "456"
    },
    "5": {
        "prdt_name": "관심 장내 채권 5",
        "prdt_nick": "장내 5",
        "code": "KR101501D9A0",
        "kbp_crdt_grad_text": "CCC",
        "nxtm_int_dfrm_dt": "20241024",
        "expd_dt": "20241031",
        "expd_asrc_erng_rt": "5.0%",
        "nice_crdt_grad_text": "CCC",
        "total_askp_rsqn": "567"
    }
  }
  ''';

  static String MarketEtBondTrendingPrice = '''
{
    "t1": {
        "prdt_name": "트렌딩 장내 채권 1",
        "expd_asrc_erng_rt": "1.0%",
        "code": "KR101501D9A0"
    },
    "t2": {
        "prdt_name": "트렌딩 장내 채권 2",
        "code": "KR101501D9A0",
        "expd_asrc_erng_rt": "-2.0%"
    },
    "t3": {
        "prdt_name": "트렌딩 장내 채권 3",
        "code": "KR101501D9A0",
        "expd_asrc_erng_rt": "3.0%"
    },
    "t4": {
        "prdt_name": "트렌딩 장내 채권 4",
        "code": "KR101501D9A0",
        "expd_asrc_erng_rt": "-4.0%"
    },
    "t5": {
        "prdt_name": "트렌딩 장내 채권 5",
        "code": "KR101501D9A0",
        "expd_asrc_erng_rt": "5.0%"
    },
    "t6": {
        "prdt_name": "트렌딩 장내 채권 6",
        "code": "KR101501D9A0",
        "expd_asrc_erng_rt": "-6.0%"
    },
    "t7": {
        "prdt_name": "트렌딩 장내 채권 7",
        "code": "KR101501D9A0",
        "expd_asrc_erng_rt": "7.0%"
    },
    "t8": {
        "prdt_name": "트렌딩 장내 채권 8",
        "code": "KR101501D9A0",
        "expd_asrc_erng_rt": "-8.0%"
    },
    "t9": {
        "prdt_name": "트렌딩 장내 채권 9",
        "code": "KR101501D9A0",
        "expd_asrc_erng_rt": "9.0%"
    },
    "t10": {
        "prdt_name": "트렌딩 장내 채권 10",
        "code": "KR101501D9A0",
        "expd_asrc_erng_rt": "-10.0%"
    },
    "t11": {
        "prdt_name": "트렌딩 장내 채권 11",
        "code": "KR101501D9A0",
        "expd_asrc_erng_rt": "11.0%"
    },
    "t12": {
        "prdt_name": "트렌딩 장내 채권 12",
        "code": "KR101501D9A0",
        "expd_asrc_erng_rt": "12.0%"
    },
    "t13": {
        "prdt_name": "트렌딩 장내 채권 13",
        "code": "KR101501D9A0",
        "expd_asrc_erng_rt": "-13.0%"
    },
    "t14": {
        "prdt_name": "트렌딩 장내 채권 14",
        "code": "KR101501D9A0",
        "expd_asrc_erng_rt": "14.0%"
    },
    "t15": {
        "prdt_name": "관심 장내 채권 15",
        "code": "KR101501D9A0",
        "expd_asrc_erng_rt": "-15.0%"
    }
}
  ''';
  static String MarketOtcBondInterestPrice = '''
[
  {
    "issu_istt_name": "미래에셋 증권",
    "prdt_nick": "장외 1",
    "code": "KR351602GB29",
    "prdt_name": "중소벤처기업진흥채권716(사)",
    "nice_crdt_grad_text": "매우낮은위험",
    "issu_dt": "20210209",
    "expd_dt": "20260209",
    "YTM": "3.41",
    "YTM_after_tax": "2.88",
    "price_per_10": "9813",
    "prdt_type_cd": "할부금융채",
    "bond_int_dfrm_mthd_cd": "이표채",
    "int_dfrm_mcnt": "3 ",
    "interest_percentage": "3.8750",
    "nxtm_int_dfrm_dt": "20241028",
    "expt_income": "10491.74",
    "total_askp_rsqn": "123"
  },
  {
    "issu_istt_name": "미래에셋 증권",
    "prdt_nick": "장외 2",
    "code": "KR351602GB29",
    "prdt_name": "중소벤처기업진흥채권716(사)",
    "nice_crdt_grad_text": "매우낮은위험",
    "issu_dt": "20210209",
    "expd_dt": "20260209",
    "YTM": "3.41",
    "YTM_after_tax": "2.88",
    "price_per_10": "9813",
    "prdt_type_cd": "할부금융채",
    "bond_int_dfrm_mthd_cd": "이표채",
    "int_dfrm_mcnt": "3 ",
    "interest_percentage": "3.8750",
    "nxtm_int_dfrm_dt": "20241029",
    "expt_income": "10491.74",
    "total_askp_rsqn": "123"
  },
  {
    "issu_istt_name": "미래에셋 증권",
    "prdt_nick": "장외 3",
    "code": "KR351602GB29",
    "prdt_name": "중소벤처기업진흥채권716(사)",
    "nice_crdt_grad_text": "매우낮은위험",
    "issu_dt": "20210209",
    "expd_dt": "20260209",
    "YTM": "3.41",
    "YTM_after_tax": "2.88",
    "price_per_10": "9813",
    "prdt_type_cd": "할부금융채",
    "bond_int_dfrm_mthd_cd": "이표채",
    "int_dfrm_mcnt": "3 ",
    "interest_percentage": "3.8750",
    "nxtm_int_dfrm_dt": "20241030",
    "expt_income": "10491.74",
    "total_askp_rsqn": "123"
  },
  {
    "issu_istt_name": "미래에셋 증권",
    "prdt_nick": "장외 4",
    "code": "KR351602GB29",
    "prdt_name": "중소벤처기업진흥채권716(사)",
    "nice_crdt_grad_text": "매우낮은위험",
    "issu_dt": "20210209",
    "expd_dt": "20260209",
    "YTM": "3.41",
    "YTM_after_tax": "2.88",
    "price_per_10": "9813",
    "prdt_type_cd": "할부금융채",
    "bond_int_dfrm_mthd_cd": "이표채",
    "int_dfrm_mcnt": "3 ",
    "interest_percentage": "3.8750",
    "nxtm_int_dfrm_dt": "20241031",
    "expt_income": "10491.74",
    "total_askp_rsqn": "123"
  },
  {
    "issu_istt_name": "미래에셋 증권",
    "prdt_nick": "장외 5",
    "code": "KR351602GB29",
    "prdt_name": "중소벤처기업진흥채권716(사)",
    "nice_crdt_grad_text": "매우낮은위험",
    "issu_dt": "20210209",
    "expd_dt": "20260209",
    "YTM": "3.41",
    "YTM_after_tax": "2.88",
    "price_per_10": "9813",
    "prdt_type_cd": "할부금융채",
    "bond_int_dfrm_mthd_cd": "이표채",
    "int_dfrm_mcnt": "3 ",
    "interest_percentage": "3.8750",
    "nxtm_int_dfrm_dt": "20241101",
    "expt_income": "10491.74",
    "total_askp_rsqn": "123"
  },
  {
    "issu_istt_name": "미래에셋 증권",
    "prdt_nick": "장외 6",
    "code": "KR351602GB29",
    "prdt_name": "중소벤처기업진흥채권716(사)",
    "nice_crdt_grad_text": "매우낮은위험",
    "issu_dt": "20210209",
    "expd_dt": "20260209",
    "YTM": "3.41",
    "YTM_after_tax": "2.88",
    "price_per_10": "9813",
    "prdt_type_cd": "할부금융채",
    "bond_int_dfrm_mthd_cd": "이표채",
    "int_dfrm_mcnt": "3 ",
    "interest_percentage": "3.8750",
    "nxtm_int_dfrm_dt": "20241102",
    "expt_income": "10491.74",
    "total_askp_rsqn": "123"
  }
]
  ''';

  static String MarketOtcBondTrendingPrice = '''
{
    "t1": {
        "prdt_name": "트렌딩 장외 채권 1",
        "code": "KR101501D9A0",
        "expd_asrc_erng_rt": "1.0%"
    },
    "t2": {
        "prdt_name": "트렌딩 장외 채권 2",
        "code": "KR101501D9A0",
        "expd_asrc_erng_rt": "-2.0%"
    },
    "t3": {
        "prdt_name": "트렌딩 장외 채권 3",
        "code": "KR101501D9A0",
        "expd_asrc_erng_rt": "3.0%"
    },
    "t4": {
        "prdt_name": "트렌딩 장외 채권 4",
        "code": "KR101501D9A0",
        "expd_asrc_erng_rt": "-4.0%"
    },
    "t5": {
        "prdt_name": "트렌딩 장외 채권 5",
        "code": "KR101501D9A0",
        "expd_asrc_erng_rt": "5.0%"
    },
    "t6": {
        "prdt_name": "트렌딩 장외 채권 6",
        "code": "KR101501D9A0",
        "expd_asrc_erng_rt": "-6.0%"
    },
    "t7": {
        "prdt_name": "트렌딩 장외 채권 7",
        "code": "KR101501D9A0",
        "expd_asrc_erng_rt": "7.0%"
    },
    "t8": {
        "prdt_name": "트렌딩 장외 채권 8",
        "code": "KR101501D9A0",
        "expd_asrc_erng_rt": "-8.0%"
    },
    "t9": {
        "prdt_name": "트렌딩 장외 채권 9",
        "code": "KR101501D9A0",
        "expd_asrc_erng_rt": "9.0%"
    },
    "t10": {
        "prdt_name": "트렌딩 장외 채권 10",
        "code": "KR101501D9A0",
        "expd_asrc_erng_rt": "-10.0%"
    },
    "t11": {
        "prdt_name": "트렌딩 장외 채권 11",
        "code": "KR101501D9A0",
        "expd_asrc_erng_rt": "11.0%"
    },
    "t12": {
        "prdt_name": "트렌딩 장외 채권 12",
        "code": "KR101501D9A0",
        "expd_asrc_erng_rt": "12.0%"
    },
    "t13": {
        "prdt_name": "트렌딩 장외 채권 13",
        "code": "KR101501D9A0",
        "expd_asrc_erng_rt": "-13.0%"
    },
    "t14": {
        "prdt_name": "트렌딩 장외 채권 14",
        "code": "KR101501D9A0",
        "expd_asrc_erng_rt": "14.0%"
    },
    "t15": {
        "prdt_name": "트렌딩 장외 채권 15",
        "code": "KR101501D9A0",
        "expd_asrc_erng_rt": "-15.0%"
    }
}
  ''';
}
