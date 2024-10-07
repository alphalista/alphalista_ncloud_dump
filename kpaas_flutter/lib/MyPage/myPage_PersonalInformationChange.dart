import 'package:flutter/material.dart';

class myPage_PersonalInformationChange extends StatelessWidget {
  const myPage_PersonalInformationChange({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("개인 정보 변경"),
      ),
      body: const Center(
        child: Text('This is the Second Page'),
      ),
    );
  }
}
