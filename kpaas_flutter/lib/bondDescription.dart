import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'apiconnectiontest/dummy_data.dart';
import 'dart:convert';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:intl/intl.dart';


class BondDescriptionPage extends StatefulWidget {
  final String bondCode;

  const BondDescriptionPage({Key? key, required this.bondCode}) : super(key: key);

  @override
  _BondDescriptionPageState createState() => _BondDescriptionPageState();
}

class _BondDescriptionPageState extends State<BondDescriptionPage> {
  Map<String, dynamic>? bondDetails;
  Map<String, dynamic>? MarketBondInquireAskingPrice;
  Map<String, dynamic>? MarketBondInquirePrice;
  List<dynamic>? MarketBondInquireDailyPrice;
  List<ChartData> chartData = [];  // Chart 데이터 리스트

  bool isLoading = true;
  final Dio dio = Dio();

  @override
  void initState() {
    super.initState();
    _fetchBondDetails();
    _fetchBondDetailsFromDummyData();
  }

  Future<void> _fetchBondDetails() async {
    final apiUrl =
        "http://10.0.2.2:8000/api/koreaib/market-bond-issue-info/market_bond_issue_info/?code=${widget.bondCode}";
    try {
      final response = await dio.get(apiUrl);
      if (response.statusCode == 200) {
        setState(() {
          bondDetails = response.data;
          isLoading = false;
        });
      } else {
        print('Failed to load bond details');
      }
    } catch (e) {
      print('Error fetching bond details: $e');
    }
  }

  Future<void> _fetchBondDetailsFromDummyData() async {
    try {
      final dummyData = jsonDecode(DummyData.MarketBondInquireAskingPrice);
      final dummyData1 = jsonDecode(DummyData.MarketBondInquirePrice);
      final dummyData2 = jsonDecode(DummyData.MarketBondInquireDailyPrice);
      Map<String, dynamic> output = dummyData['output'];
      Map<String, dynamic> output1 = dummyData1['output'];
      List<dynamic> output2 = dummyData2['output'];
      chartData = output2.map((item) {
        String dateStr = item['stck_bsop_date'];
        dateStr = dateStr.substring(0, 4) + '-' + dateStr.substring(4, 6) + '-' + dateStr.substring(6, 8); // "20240925" -> "2024-09-25"
        DateTime date = DateTime.parse(dateStr);
        double price = double.parse(item['bond_prpr']);
        return ChartData(date, price);
      }).toList();

      setState(() {
        MarketBondInquireAskingPrice = output;
        MarketBondInquirePrice = output1;
        MarketBondInquireDailyPrice = output2;
      });
    } catch (e) {
      print("Error parsing dummy data: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3, // 3개의 탭
      child: Scaffold(
        appBar: AppBar(
          title: Text('채권 상세 정보'),
          bottom: TabBar(
            tabs: [
              Tab(text: '채권 정보'),
              Tab(text: '호가 정보'),
              Tab(text: '수익'),
            ],
          ),
        ),
        body: isLoading
            ? Center(child: CircularProgressIndicator())
            : TabBarView(
          children: [
            // 채권 정보 페이지
            bondDetails != null
                ? Padding(
              padding: const EdgeInsets.all(16.0),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 16),
                    Text('채권명: ${bondDetails!['prdt_name']}', style: TextStyle(fontSize: 18)),
                    Text('채권 코드: ${widget.bondCode}', style: TextStyle(fontSize: 18)),
                    Text('발행일: ${bondDetails!['issu_dt']}', style: TextStyle(fontSize: 18)),
                    Text('만기일: ${bondDetails!['expd_dt']}', style: TextStyle(fontSize: 18)),
                    Text('채권 종류: ${bondDetails!['prdt_type_cd']}', style: TextStyle(fontSize: 18)),
                    Text('이자 지급 구분: ${bondDetails!['bond_int_dfrm_mthd_cd']}', style: TextStyle(fontSize: 18)),
                    Text('차기 이자 지급일: ${bondDetails!['nxtm_int_dfrm_dt']}', style: TextStyle(fontSize: 18)),
                    Text('이자 지급 주기: ${bondDetails!['int_dfrm_mcnt']}', style: TextStyle(fontSize: 18)),
                    Text('발행 기관 이름: ${bondDetails!['issu_istt_name']}', style: TextStyle(fontSize: 18)),
                    Text(
                        '발행 기관 신용 등급: ${bondDetails!['nice_crdt_grad_text']?.isNotEmpty == true ? bondDetails!['nice_crdt_grad_text'] : '무위험'}',
                        style: TextStyle(fontSize: 18)
                    ),
                  ],
                ),
              ),
            )
                : Center(child: Text('채권 정보를 불러올 수 없습니다')),

            // 호가 정보 페이지
            MarketBondInquireAskingPrice != null
                ? Padding(
              padding: const EdgeInsets.all(16.0),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('매수 호가 1: ${MarketBondInquireAskingPrice!['bond_bidp1']}', style: TextStyle(fontSize: 18)),
                    Text('매수 호가 1 잔량: ${MarketBondInquireAskingPrice!['bidp_rsqn1']}', style: TextStyle(fontSize: 18)),
                    Text('매수 호가 1 수익율: ${MarketBondInquireAskingPrice!['shnu_ernn_rate1']}', style: TextStyle(fontSize: 18)),
                    SizedBox(height: 8,),
                    Text('매수 호가 2: ${MarketBondInquireAskingPrice!['bond_bidp2']}', style: TextStyle(fontSize: 18)),
                    Text('매수 호가 2 잔량: ${MarketBondInquireAskingPrice!['bidp_rsqn2']}', style: TextStyle(fontSize: 18)),
                    Text('매수 호가 2 수익율: ${MarketBondInquireAskingPrice!['shnu_ernn_rate2']}', style: TextStyle(fontSize: 18)),
                    SizedBox(height: 8,),
                    Text('매수 호가 3: ${MarketBondInquireAskingPrice!['bond_bidp3']}', style: TextStyle(fontSize: 18)),
                    Text('매수 호가 3 잔량: ${MarketBondInquireAskingPrice!['bidp_rsqn3']}', style: TextStyle(fontSize: 18)),
                    Text('매수 호가 3 수익율: ${MarketBondInquireAskingPrice!['shnu_ernn_rate3']}', style: TextStyle(fontSize: 18)),
                    SizedBox(height: 8,),
                    Text('매수 호가 4: ${MarketBondInquireAskingPrice!['bond_bidp4']}', style: TextStyle(fontSize: 18)),
                    Text('매수 호가 4 잔량: ${MarketBondInquireAskingPrice!['bidp_rsqn4']}', style: TextStyle(fontSize: 18)),
                    Text('매수 호가 4 수익율: ${MarketBondInquireAskingPrice!['shnu_ernn_rate4']}', style: TextStyle(fontSize: 18)),
                    SizedBox(height: 8,),
                    Text('매수 호가 5: ${MarketBondInquireAskingPrice!['bond_bidp5']}', style: TextStyle(fontSize: 18)),
                    Text('매수 호가 5 잔량: ${MarketBondInquireAskingPrice!['bidp_rsqn5']}', style: TextStyle(fontSize: 18)),
                    Text('매수 호가 5 수익율: ${MarketBondInquireAskingPrice!['shnu_ernn_rate5']}', style: TextStyle(fontSize: 18)),
                    SizedBox(height: 8,),
                    Text('매도 호가 1: ${MarketBondInquireAskingPrice!['bond_askp1']}', style: TextStyle(fontSize: 18)),
                    Text('매도 호가 1 잔량: ${MarketBondInquireAskingPrice!['askp_rsqn1']}', style: TextStyle(fontSize: 18)),
                    Text('매도 호가 1 수익율: ${MarketBondInquireAskingPrice!['seln_ernn_rate1']}', style: TextStyle(fontSize: 18)),
                    SizedBox(height: 8,),
                    Text('매도 호가 2: ${MarketBondInquireAskingPrice!['bond_askp2']}', style: TextStyle(fontSize: 18)),
                    Text('매도 호가 2 잔량: ${MarketBondInquireAskingPrice!['askp_rsqn2']}', style: TextStyle(fontSize: 18)),
                    Text('매도 호가 2 수익율: ${MarketBondInquireAskingPrice!['seln_ernn_rate2']}', style: TextStyle(fontSize: 18)),
                    SizedBox(height: 8,),
                    Text('매도 호가 3: ${MarketBondInquireAskingPrice!['bond_askp3']}', style: TextStyle(fontSize: 18)),
                    Text('매도 호가 3 잔량: ${MarketBondInquireAskingPrice!['askp_rsqn3']}', style: TextStyle(fontSize: 18)),
                    Text('매도 호가 3 수익율: ${MarketBondInquireAskingPrice!['seln_ernn_rate3']}', style: TextStyle(fontSize: 18)),
                    SizedBox(height: 8,),
                    Text('매도 호가 4: ${MarketBondInquireAskingPrice!['bond_askp4']}', style: TextStyle(fontSize: 18)),
                    Text('매도 호가 4 잔량: ${MarketBondInquireAskingPrice!['askp_rsqn4']}', style: TextStyle(fontSize: 18)),
                    Text('매도 호가 4 수익율: ${MarketBondInquireAskingPrice!['seln_ernn_rate4']}', style: TextStyle(fontSize: 18)),
                    SizedBox(height: 8,),
                    Text('매도 호가 5: ${MarketBondInquireAskingPrice!['bond_askp5']}', style: TextStyle(fontSize: 18)),
                    Text('매도 호가 5 잔량: ${MarketBondInquireAskingPrice!['askp_rsqn5']}', style: TextStyle(fontSize: 18)),
                    Text('매도 호가 5 수익율: ${MarketBondInquireAskingPrice!['seln_ernn_rate5']}', style: TextStyle(fontSize: 18)),
                  ],
                ),
              ),
            )
                : Center(child: Text('호가 정보를 불러올 수 없습니다')),

            // 수익 페이지 + 차트 추가
            MarketBondInquirePrice != null && MarketBondInquireAskingPrice != null && MarketBondInquireDailyPrice != null
                ? Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('채결 현재가: ${MarketBondInquirePrice!['bond_prpr']}', style: TextStyle(fontSize: 18)),
                  Text('최고 매도 수익율 호가: ${MarketBondInquirePrice!['bond_hgpr']}', style: TextStyle(fontSize: 18)),
                  Text('최고 매도 수익율일 때의 만기 수익금: 니가 계산해라', style: TextStyle(fontSize: 18),),
                  Text('최고 매도 수익율 호가: ${MarketBondInquireAskingPrice!['shnu_ernn_rate5']}', style: TextStyle(fontSize: 18)),
                  SizedBox(height: 16),
                  Container(
                    height: 300, // 적절한 높이 설정
                    child: SfCartesianChart(
                      primaryXAxis: DateTimeAxis(
                        edgeLabelPlacement: EdgeLabelPlacement.shift,
                        dateFormat: DateFormat.yMd(),
                        intervalType: DateTimeIntervalType.auto,
                      ),
                      primaryYAxis: NumericAxis(
                        numberFormat: NumberFormat.currency(locale: 'ko_KR', symbol: "₩", decimalDigits: 2),
                      ),
                      series: <ChartSeries>[
                        SplineSeries<ChartData, DateTime>(
                          dataSource: chartData,
                          xValueMapper: (ChartData data, _) => data.date,
                          yValueMapper: (ChartData data, _) => data.price,
                          dataLabelSettings: DataLabelSettings(isVisible: true),
                          splineType: SplineType.monotonic,
                        )
                      ],
                    ),
                  ),
                ],
              ),
            )
                : Center(child: Text('수익 정보를 불러올 수 없습니다')),
          ],
        ),
      ),
    );
  }
}

// 차트 데이터를 담는 클래스
class ChartData {
  final DateTime date;
  final double price;

  ChartData(this.date, this.price);
}
