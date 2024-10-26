import 'package:flutter/material.dart';
import 'package:kpaas_flutter/etBondDescription.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';
import 'package:kpaas_flutter/MyPage/myPage_main.dart';
import 'package:kpaas_flutter/apiconnectiontest/dummy_data.dart';
import 'package:kpaas_flutter/otcBondDescription.dart';
import 'dart:convert';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Map<String, dynamic>? MarketEtBondInterestPrice;
  Map<String, dynamic>? MarketEtBondTrendingPrice;
  Map<String, dynamic>? MarketOtcBondInterestPrice;
  Map<String, dynamic>? MarketOtcBondTrendingPrice;
  List<Map<String, dynamic>> InterestEtBondList = [];
  List<Map<String, dynamic>> TrendingEtBondList = [];
  List<Map<String, dynamic>> InterestOtcBondList = [];
  List<Map<String, dynamic>> TrendingOtcBondList = [];


  bool InterestEtBond = true;
  bool InterestOtcBond = false;
  bool TrendingEtBond = true;
  bool TrendingOtcBond = false;

  @override
  void initState() {
    super.initState();
    _fetchBondDetailsFromDummyData();
  }

  Future<void> _fetchBondDetailsFromDummyData() async {
    try {
      final dummyData = jsonDecode(DummyData.MarketEtBondInterestPrice(5));
      final dummyData2 = jsonDecode(DummyData.MarketEtBondTrendingPrice(15));
      final dummyData3 = jsonDecode(DummyData.MarketOtcBondInterestPrice);
      final dummyData4 = jsonDecode(DummyData.MarketOtcBondTrendingPrice);

      dummyData.forEach((key, value) {
        InterestEtBondList.add({
          "prdt_name": value['prdt_name'] ?? "Unknown", // Provide default value if null
          "prdt_nick": value['prdt_nick'] ?? "Unknown",
          "code": value['code'] ?? "Unknown",
          'kbp_crdt_grad_text': value['kbp_crdt_grad_text'] ?? "N/A",
          'nxtm_int_dfrm_dt': value['nxtm_int_dfrm_dt'] ?? "N/A",
          'expd_dt': value['expd_dt'] ?? "N/A",
          'expd_asrc_erng_rt': value['expd_asrc_erng_rt'] ?? "0.0%",
          'nice_crdt_grad_text': value['nice_crdt_grad_text'] ?? "N/A",
          'total_askp_rsqn': value['total_askp_rsqn'] ?? "0"
        });
      });

      dummyData2.forEach((key, value) {
        TrendingEtBondList.add({
          "prdt_name": value['prdt_name'] ?? "Unknown",
          "code": value['code'] ?? "Unknown",
          'expd_asrc_erng_rt': value['expd_asrc_erng_rt'] ?? "0.0%"
        });
      });

      dummyData3.forEach((element) {
        InterestOtcBondList.add({
          "prdt_name": element['prdt_name'] ?? "Unknown",
          "prdt_nick": element['prdt_nick'] ?? "Unknown",
          "code": element['code'] ?? "Unknown",
          'kbp_crdt_grad_text': element['kbp_crdt_grad_text'] ?? "N/A",
          'nxtm_int_dfrm_dt': element['nxtm_int_dfrm_dt'] ?? "N/A",
          'expd_dt': element['expd_dt'] ?? "N/A",
          'expd_asrc_erng_rt': element['expd_asrc_erng_rt'] ?? "0.0%",
          'nice_crdt_grad_text': element['nice_crdt_grad_text'] ?? "N/A",
          'total_askp_rsqn': element['total_askp_rsqn'] ?? "0"
        });
      });

      dummyData4.forEach((key, value) {
        TrendingOtcBondList.add({
          "prdt_name": value['prdt_name'] ?? "Unknown",
          "code": value['code'] ?? "Unknown",
          'expd_asrc_erng_rt': value['expd_asrc_erng_rt'] ?? "0.0%"
        });
      });

      setState(() {}); // 데이터 업데이트 후 화면을 다시 그립니다.
    } catch (e) {
      print("Error parsing dummy data: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: const Color(0xFFf1f9f9),
        appBar: AppBar(
          scrolledUnderElevation: 0.0,
          title: const Text(
            '홈',
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
          ),
          backgroundColor: Colors.white,
          elevation: 0,
          actions: [
            IconButton(
              icon: const Icon(Icons.account_circle, color: Colors.black),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => MyPage()),
                );
              },
            ),
          ],
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                Container(
                  padding: const EdgeInsets.all(16.0),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 2,
                        blurRadius: 7,
                        offset: const Offset(0, 0),
                      ),
                    ],
                  ),
                  child: const Row(
                    children: [
                      Icon(Icons.whatshot, color: Colors.red),
                      SizedBox(width: 8),
                      Text(
                        '오늘의 금리 어쩌구',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                // 달력
                Container(
                  decoration: BoxDecoration(
                    color: Colors.grey[200],
                    borderRadius: BorderRadius.circular(16),
                    boxShadow: const [
                      BoxShadow(
                        color: Colors.black12,
                        spreadRadius: 3,
                        blurRadius: 10,
                        offset: Offset(0, 0),
                      ),
                    ],
                  ),
                  padding: const EdgeInsets.all(16.0),
                  child: Container(
                    height: 400,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 2,
                          blurRadius: 7,
                          offset: const Offset(0, 0),
                        ),
                      ],
                    ),
                    child: SfCalendar(
                      view: CalendarView.month,
                      dataSource: MeetingDataSource(_getDataSource(InterestEtBondList, InterestOtcBondList)),
                      headerHeight: 0,
                      monthViewSettings: const MonthViewSettings(
                        appointmentDisplayMode: MonthAppointmentDisplayMode.appointment,
                        numberOfWeeksInView: 4,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      alignment: Alignment.centerLeft,
                      child: const Text(
                        "관심채권",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Container(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          ElevatedButton(
                            onPressed: () {
                              setState(() {
                                InterestEtBond = true;
                                InterestOtcBond = false;
                              });
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: InterestEtBond ? const Color(0xFF03C75A) : Colors.white,
                              side: const BorderSide(
                                color: Color(0xFF03C75A),
                              )
                            ),
                            child: Text(
                                "장내",
                              style: TextStyle(
                                color: InterestEtBond ? Colors.white : const Color(0xFF03C75A),
                              ),
                            ),
                          ),
                          const SizedBox(width: 10,),
                          ElevatedButton(
                            onPressed: () {
                              setState(() {
                                InterestEtBond = false;
                                InterestOtcBond = true;
                              });
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: InterestOtcBond ? const Color(0xFF03C75A) : Colors.white,
                                side: const BorderSide(
                                  color: Color(0xFF03C75A),
                                )
                            ),
                            child: Text(
                                "장외",
                              style: TextStyle(
                                color: InterestOtcBond ? Colors.white : const Color(0xFF03C75A),
                              ),
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
                const SizedBox(height: 3),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: InterestEtBond
                        ? InterestEtBondList.map((bond) {
                      return _buildInterestBondItem(bond);
                    }).toList()
                        : InterestOtcBondList.map((bond) {
                      return _buildInterestBondItem(bond);
                    }).toList(),
                  ),
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      alignment: Alignment.centerLeft,
                      child: const Text(
                        "트렌딩 채권",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Container(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          ElevatedButton(
                            onPressed: () {
                              setState(() {
                                TrendingEtBond = true;
                                TrendingOtcBond = false;
                              });
                            },
                            style: ElevatedButton.styleFrom(
                                backgroundColor: TrendingEtBond ? const Color(0xFF03C75A) : Colors.white,
                                side: const BorderSide(
                                  color: Color(0xFF03C75A),
                                )
                            ),
                            child: Text(
                              "장내",
                              style: TextStyle(
                                color: TrendingEtBond ? Colors.white : const Color(0xFF03C75A),
                              ),
                            ),
                          ),
                          const SizedBox(width: 10,),
                          ElevatedButton(
                            onPressed: () {
                              setState(() {
                                TrendingEtBond = false;
                                TrendingOtcBond = true;
                              });
                            },
                            style: ElevatedButton.styleFrom(
                                backgroundColor: TrendingOtcBond ? const Color(0xFF03C75A) : Colors.white,
                                side: const BorderSide(
                                  color: Color(0xFF03C75A),
                                )
                            ),
                            child: Text(
                              "장외",
                              style: TextStyle(
                                color: TrendingOtcBond ? Colors.white : const Color(0xFF03C75A),
                              ),
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
                const SizedBox(height: 10,),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Column(
                    children: _buildTrendingBondRows(),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildInterestBondItem(Map<String, dynamic> bond) {
    return Container(
      width: 200,
      height: 200,
      margin: const EdgeInsets.symmetric(vertical: 13, horizontal: 10),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 2,
            blurRadius: 7,
            offset: const Offset(0, 0),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 3,),
          Container(
            child: GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => EtBondDescriptionPage(bondCode: bond['code']),
                  ),
                );
              },
              child: Text(
                bond['prdt_name'],
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ),
          SizedBox(
            width: double.infinity,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  "${bond['expd_asrc_erng_rt']}%",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 30,
                    color: bond['expd_asrc_erng_rt'].toString().startsWith('-')
                        ? Colors.blue
                        : const Color(0xFFD24244),
                  ),
                ),
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "신용 등급",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                  SizedBox(height: 5,),
                  Text(
                    "위험도",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                  SizedBox(height: 5,),
                  Text(
                    "잔존 수량",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    bond['kbp_crdt_grad_text'],
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                  const SizedBox(height: 5,),
                  Text(
                    bond['nice_crdt_grad_text'],
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                  const SizedBox(height: 5,),
                  Text(
                    bond['total_askp_rsqn'],
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }

  List<Widget> _buildTrendingBondRows() {
    List<Widget> rows = [];

    // 버튼 상태에 따라 보여줄 리스트 결정
    List<Map<String, dynamic>> currentBondList = TrendingEtBond ? TrendingEtBondList : TrendingOtcBondList;

    // 리스트가 비어있으면 빈 상태 처리
    if (currentBondList.isEmpty) {
      rows.add(
        const Center(
          child: Text(
            "No data available",
            style: TextStyle(fontSize: 16, color: Colors.grey),
          ),
        ),
      );
    } else {
      for (var i = 0; i < currentBondList.length; i += 5) {
        List<Widget> rowChildren = [];

        for (var j = i; j < i + 5 && j < currentBondList.length; j++) {
          var bond = currentBondList[j];
          rowChildren.add(
            Container(
              width: 230,
              height: 70,
              margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 2,
                    blurRadius: 7,
                    offset: const Offset(0, 0),
                  ),
                ],
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: 120,
                    child: GestureDetector(
                      child: Text(
                        bond['prdt_name'],
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                        overflow: TextOverflow.ellipsis,
                        softWrap: false,
                      ),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => OtcBondDescriptionPage(bondCode: bond['code']))
                        );
                      },
                    ),
                  ),
                  Text(
                    "${bond['expd_asrc_erng_rt']}%",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      color: bond['expd_asrc_erng_rt'].toString().startsWith('-')
                          ? Colors.blue
                          : const Color(0xFFD24244),
                    ),
                  ),
                ],
              ),
            ),
          );
        }
        rows.add(Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: rowChildren,
        ));
      }
    }
    return rows;
  }
}

class MeetingDataSource extends CalendarDataSource {
  MeetingDataSource(List<Appointment> source) {
    appointments = source;
  }
}

List<Appointment> _getDataSource(List<Map<String, dynamic>> bondList1, List<Map<String, dynamic>> bondList2) {
  final List<Appointment> meetings = <Appointment>[];

  // 두 리스트를 합침
  List bondLists = [...bondList1, ...bondList2];

  for (var bond in bondLists) {
    // 차기 이자 지급일 추가
    String? nextInterestDate = bond['nxtm_int_dfrm_dt'];
    if (nextInterestDate != null && nextInterestDate.length == 8) {
      DateTime nextInterest = DateTime.parse(
          '${nextInterestDate.substring(0, 4)}-${nextInterestDate.substring(4, 6)}-${nextInterestDate.substring(6, 8)}'
      );

      meetings.add(Appointment(
        startTime: nextInterest,
        endTime: nextInterest.add(const Duration(hours: 1)),
        subject: '${bond['prdt_nick'] ?? 'No Name'} - 이자 지급일',
        color: Colors.blue,
      ));
    }

    // 만기일 추가
    String? expdDate = bond['expd_dt'];
    if (expdDate != null && expdDate.length == 8) {
      DateTime expd = DateTime.parse(
          '${expdDate.substring(0, 4)}-${expdDate.substring(4, 6)}-${expdDate.substring(6, 8)}'
      );

      meetings.add(Appointment(
        startTime: expd,
        endTime: expd.add(const Duration(hours: 1)),
        subject: '${bond['prdt_nick'] ?? 'No Name'} - 만기일',
        color: Colors.red,
      ));
    }
  }

  return meetings;
}