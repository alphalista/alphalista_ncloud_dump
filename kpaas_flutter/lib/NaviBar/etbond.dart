import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kpaas_flutter/apiconnectiontest/data_controller.dart';
import 'package:kpaas_flutter/bondDescription.dart';
import 'package:kpaas_flutter/MyPage/myPage_main.dart';

class EtBondPage extends StatefulWidget {
  final List<dynamic> initialBondData;  // 처음에 받아온 데이터를 받을 변수
  final String initialNextUrl;  // 처음 받아온 데이터의 next URL

  const EtBondPage({Key? key, required this.initialBondData, required this.initialNextUrl}) : super(key: key);  // 생성자 추가

  @override
  _EtBondPageState createState() => _EtBondPageState();
}

class _EtBondPageState extends State<EtBondPage> {
  final ScrollController _scrollController = ScrollController();
  List<dynamic> bondData = [];
  String? nextUrl;
  bool isLoading = false;  // 데이터 로딩 상태
  final DataController dataController = Get.put(DataController());  // DataController 가져오기

  @override
  void initState() {
    super.initState();
    bondData = widget.initialBondData;  // 초기 데이터 설정
    nextUrl = widget.initialNextUrl;  // 초기 next URL 설정

    _scrollController.addListener(() {
      if (_scrollController.position.pixels == _scrollController.position.maxScrollExtent && !isLoading && nextUrl != null) {
        _fetchMoreData();  // 스크롤이 끝에 도달하면 추가 데이터 요청
      }
    });
  }

  Future<void> _fetchMoreData() async {
    if (nextUrl == null || isLoading) return;

    setState(() {
      isLoading = true;  // 로딩 상태 시작
    });

    try {
      final response = await dataController.fetchEtBondData(nextUrl!);  // DataController 통해 데이터 요청
      setState(() {
        bondData.addAll(response['results']);  // 받아온 데이터 리스트에 추가
        nextUrl = response['next'];  // 다음 페이지 URL 설정
      });
    } catch (e) {
      print('Error fetching more data: $e');
    } finally {
      setState(() {
        isLoading = false;  // 로딩 상태 종료
      });
    }
  }

  @override
  void dispose() {
    _scrollController.dispose();  // 스크롤 컨트롤러 해제
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF1F1F9),
      appBar: AppBar(
        scrolledUnderElevation: 0.0,
        title: const Text(
          '장내 채권',
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
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              controller: _scrollController,  // 스크롤 컨트롤러 설정
              itemCount: bondData.length + 1,  // 데이터 개수 + 로딩 인디케이터
              itemBuilder: (context, index) {
                if (index == 0) {
                  // 첫 번째 컨테이너 전에 간격을 추가
                  return const SizedBox(height: 20);  // 원하는 크기의 간격 설정
                }

                final actualIndex = index - 1;  // 데이터는 실제로는 1부터 시작

                if (actualIndex == bondData.length) {
                  return _buildLoadingIndicator();  // 로딩 인디케이터 표시
                }

                return GestureDetector(
                  onTap: () {
                    // 제목 클릭 시 BondDescriptionPage로 이동, bondCode 전달
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => BondDescriptionPage(
                          bondCode: bondData[actualIndex]['code'],  // 채권 코드 전달
                        ),
                      ),
                    );
                  },
                  child: Container(
                    height: 200,
                    margin: const EdgeInsets.symmetric(vertical: 13, horizontal: 30),
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: Colors.white, // 배경 색상
                      borderRadius: BorderRadius.circular(12), // 둥근 모서리
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5), // 그림자 색상
                          spreadRadius: 0,
                          blurRadius: 0,
                          offset: const Offset(0,0), // 그림자의 위치
                        ),
                      ],
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          bondData[actualIndex]['name'],  // 채권명
                          style: const TextStyle(
                            fontSize: 28,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 8),
                        const Padding(
                          padding: EdgeInsets.symmetric(horizontal: 20.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Padding(
                                padding: EdgeInsets.only(left: 8.0),
                                child: Column(
                                  children: [
                                    Text(
                                      '잔존 수량',
                                      style: TextStyle(
                                        fontSize: 16,
                                        color: Color(0xFF696969),
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                    Text(
                                      'B+',
                                      style: TextStyle(
                                        fontSize: 20,
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    Text(
                                      '듀레이션',
                                      style: TextStyle(
                                        fontSize: 16,
                                        color: Color(0xFF696969),
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                    Text(
                                      '3.27',
                                      style: TextStyle(
                                        fontSize: 20,
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(left: 7.0),
                                child: Column(
                                  children: [
                                    Text(
                                      '신용 등급',
                                      style: TextStyle(
                                        fontSize: 16,
                                        color: Color(0xFF696969),
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                    Text(
                                      'AAA',
                                      style: TextStyle(
                                        fontSize: 20,
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    Text(
                                      '만기일',
                                      style: TextStyle(
                                        fontSize: 16,
                                        color: Color(0xFF696969),
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                    Text(
                                      '27.03.02',
                                      style: TextStyle(
                                        fontSize: 20,
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Column(
                                children: [
                                  Text(
                                    '세후 수익률',
                                    style: TextStyle(
                                      fontSize: 16,
                                      color: Color(0xFF696969),
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                  Text(
                                    '4.2%',
                                    style: TextStyle(
                                      fontSize: 20,
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Text(
                                    '발행일',
                                    style: TextStyle(
                                      fontSize: 16,
                                      color: Color(0xFF696969),
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                  Text(
                                    '23.02.01',
                                    style: TextStyle(
                                      fontSize: 20,
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildLoadingIndicator() {
    if (isLoading) {
      return const Padding(
        padding: EdgeInsets.all(8.0),
        child: Center(
          child: CircularProgressIndicator(),  // 로딩 중일 때 인디케이터
        ),
      );
    } else {
      return const SizedBox.shrink();  // 로딩 중이 아닐 때는 빈 공간
    }
  }
}

