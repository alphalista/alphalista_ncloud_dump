import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:kpaas_flutter/apiconnectiontest/data_controller.dart';
import 'package:kpaas_flutter/MyPage/myPage_main.dart';

class NewsPage extends StatefulWidget {
  const NewsPage({super.key});

  @override
  State<NewsPage> createState() => _NewsPageState();
}

class _NewsPageState extends State<NewsPage> {
  @override
  void initState() {
    super.initState();
    initializeDateFormatting('ko_KR', null); // Initialize date formatting for Korean locale
  }

  String cleanText(String text) {
    RegExp htmlTagExp = RegExp(r"<[^>]*>", multiLine: true, caseSensitive: true);
    String noHtml = text.replaceAll(htmlTagExp, '');
    return noHtml.replaceAll('&quot;', '').replaceAll('&amp;', '&').replaceAll('&lt;', '<').replaceAll('&gt;', '>');
  }

  String formatPubDate(String pubDate) {
    try {
      // DateTime 객체로 파싱
      DateTime dateTime = DateFormat("EEE, dd MMM yyyy HH:mm:ss Z", "en_US").parse(pubDate);

      // 원하는 형식으로 변환
      String formattedDate = DateFormat("MM.dd HH:mm", "ko_KR").format(dateTime);
      return formattedDate;
    } catch (e) {
      print('Date parsing error: $e');
      return pubDate; // 변환에 실패하면 원래 값을 반환
    }
  }

  Future<void> refreshData() async {
    final controller = Get.find<DataController>();
    await controller.fetchData();
  }

  Future<void> _launchURL(String url) async {
    final Uri uri = Uri.parse(url);
    if (!await launchUrl(uri)) {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    final DataController dataController = Get.put(DataController());
    return Scaffold(
      appBar: AppBar(
        title: Text(
          '뉴스',
          style: TextStyle(
            color: Colors.black, // 텍스트 색상 검정
            fontWeight: FontWeight.bold, // 텍스트 굵게
            fontSize: 20, // 폰트 크기
          ),
        ),
        backgroundColor: Colors.white, // 앱바 배경색 하얀색으로 설정
        elevation: 0, // 그림자 제거
        actions: [
          IconButton(
            icon: Icon(Icons.account_circle, color: Colors.black), // 사용자 아이콘 추가
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => MyPage()), // MyPage로 이동
              );
            },
          ),
        ],
      ),
      body: Container(
        color: const Color(0xfff6f6f8),
        child: Obx(() {
          if (dataController.isLoading.value) {
            return const Center(child: CircularProgressIndicator());
          }

          if (dataController.news.isEmpty) {
            return const Center(child: Text("No Data Available"));
          }

          return RefreshIndicator(
            onRefresh: refreshData,
            child: ListView.builder(
              itemCount: dataController.news.length,
              itemBuilder: (context, index) {
                var title = cleanText(dataController.news[index]['title']);
                var description = cleanText(dataController.news[index]['description']);
                var pubDate = formatPubDate(cleanText(dataController.news[index]['pubDate']));
                var originalLink = dataController.news[index]['originallink'];

                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Card(
                    elevation: 4.0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(22.0),
                    ),
                    child: Container(
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(20.0)),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black26,
                            blurRadius: 20.0,
                            offset: Offset(4, 4),
                          ),
                        ],
                      ),
                      child: SizedBox(
                        height: 160,
                        width: 320,
                        child: ListTile(
                          title: GestureDetector(
                            onTap: () => _launchURL(originalLink),
                            child: Text(
                              title,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: const TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          subtitle: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const SizedBox(height: 10),
                              Text(
                                description,
                                maxLines: 3,
                                overflow: TextOverflow.ellipsis,
                              ),
                              const SizedBox(height: 10),
                              Text(
                                '$pubDate',
                                style: const TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          );
        }),
      ),
    );
  }
}
