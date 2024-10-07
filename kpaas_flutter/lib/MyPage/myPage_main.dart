import 'package:kpaas_flutter/MyPage/myPage_PersonalInformationChange.dart';
import 'package:flutter/material.dart';

class MyPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('마이 페이지'),
      ),
      body: Center(
        child: GestureDetector(
          onTap: () {
            Navigator.push(context,
            MaterialPageRoute(builder: (context) => const myPage_PersonalInformationChange()),
            );
          },
          child: Text("개인 정보 변경"),
        ),
      ),
    );
  }
}
