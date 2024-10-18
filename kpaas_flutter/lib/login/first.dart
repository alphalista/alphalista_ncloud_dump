import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:kakao_flutter_sdk_user/kakao_flutter_sdk_user.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:dio/dio.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await dotenv.load(fileName: "assets/config/.env");
  final kakaoNativeAppKey = dotenv.env['KAKAO_NATIVE_APP_KEY'];
  final javaScriptAppKey = dotenv.env['KAKAO_JAVASCRIPT_APP_KEY'];

  KakaoSdk.init(
    nativeAppKey: kakaoNativeAppKey,
    javaScriptAppKey: javaScriptAppKey,
  );
  runApp(MyApp());
}

Future<void> sendGetRequest() async {
  final kakaoRestApiKey = dotenv.env['KAKAO_REST_API_KEY'];
  const redirectUri = 'http://localhost:3000/auth/login/kakao-callback';  // Django 백엔드로 리디렉션할 URL
  final Dio dio = Dio();

  try {
    // 카카오 인증을 위한 AuthCodeClient 사용
    String authCode = await AuthCodeClient.instance.authorize(
      clientId: kakaoRestApiKey!,
      redirectUri: redirectUri,
    );

    print('카카오 계정으로 로그인 성공, 인증 코드: $authCode');

    // 인증 코드를 Django 백엔드로 전송
    final response = await dio.post(
      'http://localhost:3000/auth/login/kakao-callback',  // DRF 엔드포인트
      data: {
        'code': authCode,  // 인증 코드 전송
      },
    );

    // Django 서버 응답 확인
    if (response.statusCode == 200) {
      print('백엔드로부터 응답 수신: ${response.data}');
    } else {
      print('백엔드 요청 실패: ${response.statusCode}');
    }
  } catch (error) {
    print('카카오 계정으로 로그인 실패 $error');
  }
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '3 Page Navigation',
      home: TabNavigationExample(),
    );
  }
}

class TabNavigationExample extends StatefulWidget {
  @override
  _TabNavigationExampleState createState() => _TabNavigationExampleState();
}

class _TabNavigationExampleState extends State<TabNavigationExample> with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);

    // 탭의 변화 감지
    _tabController.addListener(() {
      setState(() {});
    });
  }

  void _onPrev() {
    if (_tabController.index > 0) {
      setState(() {
        _tabController.animateTo(_tabController.index - 1);
      });
    }
  }

  void _onNext() {
    if (_tabController.index < 2) {
      setState(() {
        _tabController.animateTo(_tabController.index + 1);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: TabBarView(
        controller: _tabController,
        children: <Widget>[
          Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 70),
                const Padding(
                  padding: EdgeInsets.only(left: 20),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      '채권 통합 서비스,\nLEAP에 오신 걸 환영해요',
                      style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(left: 20),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      '복잡한 채권 정보 열람과 내 채권 자산 관리를\nLEAP에서 쉽게 통합해보세요',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                ),
                Spacer(),
                Align(
                  alignment: Alignment.center,
                  child: Container(
                    width: 350,
                    child: Image.asset(
                      'assets/images/FirstLoginImage.png',
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            child: Column(
              children: [
                Text("텍스트 2"),
                Spacer(),
                Align(
                  alignment: Alignment.center,
                  child: Container(
                    width: 350,
                    child: Image.asset(
                      'assets/images/SecondLoginImage.png',
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(),
        ],
      ),
      bottomNavigationBar: BottomAppBar(
        color: Colors.black,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10.0),
          child: _tabController.index != 2
              ? Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(left: 50),
                child: GestureDetector(
                  onTap: _onPrev,
                  child: const Text(
                    '이전',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
              ),
              Row(
                children: <Widget>[
                  Icon(Icons.circle, size: 10, color: _tabController.index == 0 ? Colors.white : Colors.grey),
                  const SizedBox(width: 5),
                  Icon(Icons.circle, size: 10, color: _tabController.index == 1 ? Colors.white : Colors.grey),
                  const SizedBox(width: 5),
                  Icon(Icons.circle, size: 10, color: _tabController.index == 2 ? Colors.white : Colors.grey),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(right: 50),
                child: GestureDetector(
                  onTap: _onNext,
                  child: const Text(
                    "다음",
                    style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 18,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ],
          )
              : Center(
            child: GestureDetector(
              onTap: sendGetRequest,
              child: const Text(
                '카카오로 시작하기',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w400,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
