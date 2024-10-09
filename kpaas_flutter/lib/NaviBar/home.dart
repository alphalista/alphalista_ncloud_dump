import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';
import 'package:kpaas_flutter/MyPage/myPage_main.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: const Color(0xFFf1f9f9),
        appBar: AppBar(
          title: const Text(
            '홈',
            style: TextStyle(
              color: Colors.black, // 텍스트 색상 검정
              fontWeight: FontWeight.bold, // 텍스트 굵게
              fontSize: 20, // 폰트 크기
            ),
          ),
          backgroundColor: Colors.white, // 앱바 배경색
          elevation: 0, // 그림자 제거
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
          padding: const EdgeInsets.all(20.0), // 패딩 값 조절
          child: Column(
            children: [
              // 텍스트와 아이콘을 포함한 컨테이너
              Container(
                padding: const EdgeInsets.all(16.0),
                decoration: BoxDecoration(
                  color: Colors.white, // 배경 색상
                  borderRadius: BorderRadius.circular(12), // 둥근 모서리
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5), // 그림자 색상
                      spreadRadius: 2, // 그림자 퍼짐 정도
                      blurRadius: 7, // 그림자 흐림 정도
                      offset: const Offset(0, 3), // 그림자의 위치
                    ),
                  ],
                ),
                child: const Row(
                  children: [
                    Icon(
                      Icons.whatshot, // 불 모양 아이콘
                      color: Colors.red, // 아이콘 색상
                    ),
                    Text(
                      '오늘의 금리 어쩌구', // 텍스트
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20), // 텍스트 컨테이너와 달력 사이의 간격
              Container(
                decoration: BoxDecoration(
                  color: Colors.grey[200], // 외부 컨테이너 배경 색상
                  borderRadius: BorderRadius.circular(16), // 외부 컨테이너 둥근 모서리
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.black12, // 그림자 색상
                      spreadRadius: 3, // 그림자 퍼짐 정도
                      blurRadius: 10, // 그림자 흐림 정도
                      offset: Offset(0, 4), // 그림자의 위치
                    ),
                  ],
                ),
                padding: const EdgeInsets.all(16.0), // 외부 컨테이너 내부 여백
                child: Container(
                  height: 400,
                  decoration: BoxDecoration(
                    color: Colors.white, // 내부 컨테이너 배경 색상
                    borderRadius: BorderRadius.circular(12), // 내부 컨테이너 둥근 모서리
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5), // 내부 컨테이너 그림자
                        spreadRadius: 2, // 그림자 퍼짐 정도
                        blurRadius: 7, // 그림자 흐림 정도
                        offset: const Offset(0, 3), // 그림자의 위치
                      ),
                    ],
                  ),
                  child: SfCalendar(
                    view: CalendarView.month, // 월 단위로 설정
                    dataSource: MeetingDataSource(_getDataSource()),
                    headerHeight: 0, // 달력 상단의 현재 월/년도 텍스트를 없앰
                    monthViewSettings: const MonthViewSettings(
                      appointmentDisplayMode: MonthAppointmentDisplayMode.appointment,
                      numberOfWeeksInView: 4,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class MeetingDataSource extends CalendarDataSource {
  MeetingDataSource(List<Appointment> source) {
    appointments = source;
  }
}

List<Appointment> _getDataSource() {
  final List<Appointment> meetings = <Appointment>[];

  final DateTime now = DateTime.now();

  final DateTime startTime1 = DateTime(now.year, now.month, now.day, 9, 0, 0);
  final DateTime endTime1 = startTime1.add(const Duration(hours: 2));
  meetings.add(Appointment(
    startTime: startTime1,
    endTime: endTime1,
    subject: '회의 1',
    color: Colors.blue,
  ));

  final DateTime startTime2 = DateTime(now.year, now.month, now.day, 13, 0, 0);
  final DateTime endTime2 = startTime2.add(const Duration(hours: 1));
  meetings.add(Appointment(
    startTime: startTime2,
    endTime: endTime2,
    subject: '점심 미팅',
    color: Colors.green,
  ));

  final DateTime startTime3 = DateTime(now.year, now.month, now.day + 2, 16, 0, 0);
  final DateTime endTime3 = startTime3.add(const Duration(hours: 1));
  meetings.add(Appointment(
    startTime: startTime3,
    endTime: endTime3,
    subject: '프로젝트 회의',
    color: Colors.red,
  ));

  return meetings;
}
