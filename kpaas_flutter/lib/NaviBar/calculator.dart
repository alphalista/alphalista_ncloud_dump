import 'package:flutter/material.dart';
import 'package:kpaas_flutter/MyPage/myPage_main.dart';

class CalculatorPage extends StatefulWidget {
  @override
  _CalculatorPageState createState() => _CalculatorPageState();
}

class _CalculatorPageState extends State<CalculatorPage> {
  // 검색 바의 입력 값을 저장할 변수
  final TextEditingController searchController = TextEditingController();

  // 계산 버튼 클릭 후 나타나는 텍스트 상태 관리
  bool isResultVisible = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF1F1F9),
      appBar: AppBar(
        scrolledUnderElevation: 0.0,
        title: const Text(
          '투자 계산기',
          style: TextStyle(
            color: Colors.black, // 텍스트 색상 검정
            fontWeight: FontWeight.bold, // 텍스트 굵게
            fontSize: 20, // 폰트 크기
          ),
        ),
        backgroundColor: Colors.white, // 앱바 배경색
        elevation: 0,
        actions: [
          IconButton(
            icon: const Icon(Icons.account_circle, color: Colors.black), // 사용자 아이콘 추가
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
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              controller: searchController,
              decoration: const InputDecoration(
                labelText: '검색',
                hintText: '채권명/채권코드를 입력하세요',
                border: OutlineInputBorder(),
                fillColor: Colors.white,
                filled:true,
              ),
            ),
            const SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {

              },
              child: const Text('추가하기'),
            ),
            const SizedBox(height: 16.0),

            // 3. 첫 번째 컨테이너
            Container(
              height: 100,
              color: Colors.blue[100],
              alignment: Alignment.center,
              child: const Text(
                '첫 번째 컨테이너',
                style: TextStyle(fontSize: 18),
              ),
            ),
            const SizedBox(height: 16.0),

            // 4. 두 번째 컨테이너
            Container(
              height: 100,
              color: Colors.green[100],
              alignment: Alignment.center,
              child: const Text(
                '두 번째 컨테이너',
                style: TextStyle(fontSize: 18),
              ),
            ),
            const SizedBox(height: 16.0),

            // 5. 계산하기 버튼
            ElevatedButton(
              onPressed: () {
                setState(() {
                  // 계산하기 버튼을 눌렀을 때 결과를 나타내기
                  isResultVisible = true;
                });
              },
              child: const Text('계산하기'),
            ),
            const SizedBox(height: 16.0),

            // 6. 계산하기 버튼을 누르면 나타나는 텍스트
            if (isResultVisible)
              const Text(
                '계산 결과가 여기 나타납니다!',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
          ],
        ),
      ),
    );
  }
}
