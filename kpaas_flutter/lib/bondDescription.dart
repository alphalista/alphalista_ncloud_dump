import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kpaas_flutter/apiconnectiontest/data_controller.dart';

void main() => runApp(BondDescription());

class BondDescription extends StatefulWidget {
  @override
  _BondDescriptionState createState() => _BondDescriptionState();
}

class _BondDescriptionState extends State<BondDescription> {
  DateTime today = DateTime.now();
  int selectedGraph = 0;

  List<BarChartGroupData> firstGraphData = [];
  List<BarChartGroupData> secondGraphData = [];

  List<dynamic> monthList = [10, 13, 35, 12, 50];

  @override
  void initState() {
    super.initState();

    // 첫 번째 그래프 데이터 초기화
    firstGraphData = [
      BarChartGroupData(
          x: 0,
          barRods: [
            BarChartRodData(toY: 10.toDouble(), color: const Color(0xffE6E1D8), width: 15)
          ]),
      BarChartGroupData(
          x: 1,
          barRods: [
            BarChartRodData(toY: 13.toDouble(), color: Colors.orange, width: 15)
          ]),
      BarChartGroupData(
          x: 2,
          barRods: [
            BarChartRodData(toY: 17.toDouble(), color: Colors.orange, width: 15)
          ]),
      BarChartGroupData(
          x: 3,
          barRods: [
            BarChartRodData(toY: 25.toDouble(), color: Colors.orange, width: 15)
          ]),
      BarChartGroupData(
          x: 4,
          barRods: [
            BarChartRodData(toY: 11.toDouble(), color: Colors.orange, width: 15)
          ]),
      BarChartGroupData(
          x: 5,
          barRods: [
            BarChartRodData(toY: 9.toDouble(), color: Colors.orange, width: 15)
          ]),
      BarChartGroupData(
          x: 6,
          barRods: [
            BarChartRodData(toY: 30.toDouble(), color: Colors.orange, width: 15)
          ]),
    ];

    // 두 번째 그래프 데이터 초기화
    secondGraphData = List.generate(monthList.length, (index) {
      return BarChartGroupData(
        x: index,
        barRods: [
          BarChartRodData(toY: monthList[index].toDouble(), color: Colors.orange, width: 15)
        ],
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    String formattedDate = "${today.year}년 ${today.month}월 ${today.day}일";
    final DataController dataController = Get.put(DataController());
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Center(child: Text('기록'))),
      body: Obx(() {
      if (dataController.isLoading.value) {
      return const Center(child: CircularProgressIndicator());
      }
      if (dataController.market_bond_issue_info.isEmpty ||
        dataController.market_bond_inquire_daily_price.isEmpty) {
      return const Center(child: Text('No Data Available'));
      }

      int index1 = 0;  // 원하는 인덱스값
      int index2 = 0;  // 원하는 인덱스값

      if (dataController.market_bond_issue_info.length > index1 &&
      dataController.market_bond_inquire_daily_price.length > index2) {
      var data1 = dataController.market_bond_issue_info[index1];  // market_bond_issue_info의 특정 인덱스 값
      var data2 = dataController.market_bond_inquire_daily_price[index2];  // market_bond_inquire_daily_price의 특정 인덱스 값

      return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 42.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '${data1['prdt_name'] ?? 'N/A'}',
                      style: const TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      formattedDate,
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                    Container(
                      width: 400,
                      child: const Divider(
                        color: Colors.grey,
                        thickness: 1,
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 20.0),
                          child: TextBox("발행일"),
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 36.0),
                          child: Text("${data1['issu_dtd'] ?? 'N/A'}"),
                        ),
                        const SizedBox(height: 18),
                        Padding(
                          padding: const EdgeInsets.only(left: 20.0),
                          child: TextBox('이자 지급 구분'),
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 36.0),
                          child: Text("${data1['ksd_bond_int_dfrm_dvsn_cd'] ?? 'N/A'}"),
                        ),
                        const SizedBox(height: 18),
                        Padding(
                          padding: const EdgeInsets.only(left: 20.0),
                          child: TextBox("신용 등급"),
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 36.0),
                          child: Text("${data1['kbp_crdt_grad_text'] ?? 'N/A'}"),
                        )
                      ],
                    ),
                    SizedBox(height: 18),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 30),
                          child: TextBox('만기일'),
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 45),
                          child: Text("${data1['expd_dt'] ?? 'N/A'}"),
                        ),
                        const SizedBox(height: 18),
                        Padding(
                          padding: const EdgeInsets.only(left: 30),
                          child: TextBox('차기 이자 지급'),
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 47.0),
                          child: Text("${data1['nxtm_int_dfrm_dt'] ?? 'N/A'}"),
                        ),
                        const SizedBox(height: 18),
                        Padding(
                          padding: const EdgeInsets.only(left: 30),
                          child: TextBox("세전 수익률"),
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 47.0),
                          child: Text("${data1['expd_asrc_erng_rt'] ?? 'N/A'}"),
                        ),
                      ],
                    ),
                    const SizedBox(height: 18),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 40.0),
                          child: TextBox('채권 종류'),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 15.0),
                          child: Text("${data1['bond_clsf_kor_name'] ?? 'N/A'}"),
                        ),
                        const SizedBox(height: 18),
                        TextBox('이자 지급 주기'),
                        Padding(
                          padding: EdgeInsets.only(right: 15.0),
                          child: Text("${data1['int_dfrm_mcnt'] ?? 'N/A'}개월"),
                        ),
                        const SizedBox(height: 18),
                        TextBox("예상 수익금"),
                        const Padding(
                          padding: EdgeInsets.only(right: 15.0),
                          child: Text("몰루레이후"),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              Center(
                child: Container(
                  constraints: const BoxConstraints(
                    maxWidth: 300,
                    maxHeight: 30,
                  ),
                  decoration: BoxDecoration(
                    color: const Color(0xffE6E1D8),
                    borderRadius: BorderRadius.circular(50),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TextButton(
                        onPressed: () {
                          setState(() {
                            selectedGraph = 0;
                          });
                        },
                        style: TextButton.styleFrom(
                          backgroundColor: selectedGraph == 0
                              ? Colors.white
                              : const Color(0xffE6E1D8),
                          foregroundColor: Colors.black,
                          padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 50),
                        ),
                        child: const Text("Weekly", style: TextStyle(fontSize: 10)),
                      ),
                      const SizedBox(width: 5),
                      TextButton(
                        onPressed: () {
                          setState(() {
                            selectedGraph = 1;
                          });
                        },
                        style: TextButton.styleFrom(
                          backgroundColor: selectedGraph == 1
                              ? Colors.white
                              : const Color(0xffE6E1D8),
                          foregroundColor: Colors.black,
                          padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 50),
                        ),
                        child: const Text('Monthly', style: TextStyle(fontSize: 10)),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 16),
              Expanded(
                child: Center(
                  child: Container(
                    height: MediaQuery.of(context).size.height / 2,
                    padding: const EdgeInsets.all(16.0),
                    child: BarChart(
                      BarChartData(
                        alignment: BarChartAlignment.spaceAround,
                        barGroups: selectedGraph == 0 ? firstGraphData : secondGraphData,
                        borderData: FlBorderData(show: false),
                        gridData: const FlGridData(
                          show: false,
                        ),
                        titlesData: FlTitlesData(
                          bottomTitles: AxisTitles(
                            sideTitles: SideTitles(
                              showTitles: true,
                              getTitlesWidget: (double value, TitleMeta meta) {
                                const style = TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 14,
                                );
                                if (selectedGraph == 0) {
                                  List<String> days = ['Sun', 'Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat'];
                                  return Text(days[value.toInt()], style: style);
                                } else {
                                  return Text((value.toInt() + 1).toString(), style: style);
                                }
                              },
                            ),
                          ),
                          rightTitles: const AxisTitles(sideTitles: SideTitles(showTitles: false)),
                          topTitles: const AxisTitles(sideTitles: SideTitles(showTitles: false)),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          );
        } else {
        return const Center(child: Text('Invalid index or no data available.'));
      }
    }),
      ),
    );
  }
}

class TextBox extends StatelessWidget {
  final String text;

  TextBox(this.text);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
      child: Text(
        text,
        style: const TextStyle(color: Colors.black, fontSize: 15, fontWeight: FontWeight.bold),
      ),
    );
  }
}
