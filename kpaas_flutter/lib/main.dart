import 'package:flutter/material.dart';
import 'NaviBar/home.dart';
import 'NaviBar/etbond.dart';
import 'NaviBar/otcbond.dart';
import 'NaviBar/calculator.dart';
import 'NaviBar/news.dart';
import 'MyPage/myPage_main.dart'; // MyPage import

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
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

  static final List<Widget> _widgetOptions = <Widget>[
    HomePage(),
    EtBondPage(),
    OtcBondPage(),
    CalculatorPage(),
    NewsPage(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Padding(
          padding: EdgeInsets.only(left: 60),
          child: Center(child: Text('알파리스타')),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.account_circle),  // 사용자 아이콘 추가
            onPressed: () {
              // 사용자 아이콘 클릭 시 MyPage로 이동
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => MyPage()), // MyPage로 이동
              );
            },
          ),
        ],
      ),
      body: _widgetOptions.elementAt(_selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
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
}