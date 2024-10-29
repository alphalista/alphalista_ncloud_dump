import 'package:flutter/material.dart';
import 'package:kpaas_flutter/etBondDescription.dart';
import 'package:kpaas_flutter/MyPage/myPage_main.dart';

class EtBondPage extends StatefulWidget {
  final List<dynamic> initialBondData;
  final String initialNextUrl;

  const EtBondPage({Key? key, required this.initialBondData, required this.initialNextUrl}) : super(key: key);

  @override
  _EtBondPageState createState() => _EtBondPageState();
}

class _EtBondPageState extends State<EtBondPage> {
  final ScrollController _scrollController = ScrollController();
  List<dynamic> bondData = [];
  String? nextUrl;
  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    bondData = widget.initialBondData;
    nextUrl = widget.initialNextUrl;

    _scrollController.addListener(() {
      if (_scrollController.position.pixels == _scrollController.position.maxScrollExtent && !isLoading) {
        _fetchMoreData();  // 스크롤이 끝에 도달하면 추가 데이터 요청
      }
    });
  }
  String formatDate(String date) {
    if (date.length == 8) {
      return '${date.substring(2, 4)}.${date.substring(4, 6)}.${date.substring(6, 8)}';
    }
    return date; // 형식이 맞지 않을 경우 원래 값 반환
  }

  Future<void> _fetchMoreData() async {
    setState(() {
      isLoading = true;  // 로딩 상태 시작
    });


    setState(() {
      isLoading = false;  // 로딩 상태 종료
    });
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
                  return const SizedBox(height: 20);  // 첫 번째 컨테이너 전에 간격 추가
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
                        builder: (context) => EtBondDescriptionPage(),
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
                          offset: const Offset(0, 0),
                        ),
                      ],
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          bondData[actualIndex]['name'] ?? 'N/A',  // 채권명
                          style: const TextStyle(
                            fontSize: 28,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(left: 8.0),
                                child: Column(
                                  children: [
                                    const Text(
                                      '잔존 수량',
                                      style: TextStyle(
                                        fontSize: 16,
                                        color: Color(0xFF696969),
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                    Text(
                                      bondData[actualIndex]['total_askp_rsqn']  ?? 'N/A',  // 잔존 수량
                                      style: const TextStyle(
                                        fontSize: 20,
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    const Text(
                                      '듀레이션',
                                      style: TextStyle(
                                        fontSize: 16,
                                        color: Color(0xFF696969),
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                    Text(
                                      bondData[actualIndex]['bond_avrg_drtn_val'] ?? "N/A",  // 듀레이션
                                      style: const TextStyle(
                                        fontSize: 20,
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 7.0),
                                child: Column(
                                  children: [
                                    const Text(
                                      '신용 등급',
                                      style: TextStyle(
                                        fontSize: 16,
                                        color: Color(0xFF696969),
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                    Text(
                                      bondData[actualIndex]['nice_crdt_grad_text'] ?? 'N/A',  // 신용 등급
                                      style: const TextStyle(
                                        fontSize: 20,
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    const Text(
                                      '만기일',
                                      style: TextStyle(
                                        fontSize: 16,
                                        color: Color(0xFF696969),
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                    Text(
                                      formatDate(bondData[actualIndex]['expd_dt']) ?? 'N/A',  // 만기일
                                      style: const TextStyle(
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
                                  const Text(
                                    '세후 수익률',
                                    style: TextStyle(
                                      fontSize: 16,
                                      color: Color(0xFF696969),
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                  Text(
                                    '${bondData[actualIndex]['YTM_after_tax'] ?? 'N/A'}%',  // 세후 수익률
                                    style: const TextStyle(
                                      fontSize: 20,
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  const Text(
                                    '발행일',
                                    style: TextStyle(
                                      fontSize: 16,
                                      color: Color(0xFF696969),
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                  Text(
                                    formatDate(bondData[actualIndex]['issu_dt']) ?? 'N/A',  // 발행일
                                    style: const TextStyle(
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
          child: CircularProgressIndicator(),
        ),
      );
    } else {
      return const SizedBox.shrink();
    }
  }
}
