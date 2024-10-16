import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'NaviBar/home.dart';
import 'NaviBar/etbond.dart';
import 'NaviBar/otcbond.dart';
import 'NaviBar/calculator.dart';
import 'NaviBar/news.dart';
import 'MyPage/myPage_main.dart';
import 'apiconnectiontest/data_controller.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: Colors.white,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _selectedIndex = 0;
  final DataController dataController = Get.put(DataController());
  List<dynamic> etBondData = [];
  List<dynamic> otcBondData = [];
  String nextEtBondUrl = '';
  String nextOtcBondUrl = '';
  List<dynamic> newsData = [];

  @override
  void initState() {
    super.initState();
    fetchBondData();
    fetchNewsData();
  }

  Future<void> fetchBondData() async {
    final etResponse = await dataController.fetchEtBondData("http://10.0.2.2:8000/api/koreaib/market-bond-code/?limit=20");
    etBondData = etResponse['results'];
    nextEtBondUrl = etResponse['next'];

    final otcResponse = await dataController.fetchEtBondData("http://10.0.2.2:8000/api/koreaib/market-bond-code/?limit=20");
    otcBondData = otcResponse['results']; // 장외채권 데이터 설정
    nextOtcBondUrl = otcResponse['next']; // 다음 장외채권 페이지 URL 설정

    setState(() {});
  }

  Future<void> fetchNewsData() async {
    newsData = await dataController.fetchNewsData();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: _selectedIndex == 0
          ? HomePage() // 홈 페이지
          : _selectedIndex == 1
          ? EtBondPage(
        initialBondData: etBondData,  // EtBondPage에 장내채권 데이터를 전달
        initialNextUrl: nextEtBondUrl,  // EtBondPage에 next URL 전달
      )
          : _selectedIndex == 2
          ? OtcBondPage(
        initialBondData: otcBondData,  // OtcBondPage에 장외채권 데이터를 전달
        initialNextUrl: nextOtcBondUrl,  // OtcBondPage에 next URL 전달
      )
          : _selectedIndex == 3
          ? CalculatorPage() // 투자 계산기 페이지
          : NewsPage(newsData: newsData),  // 뉴스 페이지

      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white,
        type: BottomNavigationBarType.fixed,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: '홈',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.bar_chart),
            label: '장내 채권',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.stacked_bar_chart),
            label: '장외 채권',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.calculate),
            label: '투자 계산기',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.newspaper),
            label: '뉴스',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.blueGrey,
        onTap: _onItemTapped,  // 아이템 클릭 시 호출
      ),
    );
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
}
