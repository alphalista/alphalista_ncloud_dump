import 'package:flutter/material.dart';

class MatureBondDisplay extends StatelessWidget {
  const MatureBondDisplay({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('만기된 채권 목록'),
      ),
      body: Center(
        child: Text(
          '여기에 만기된 채권 목록이 표시됩니다.',
          style: TextStyle(fontSize: 18),
        ),
      ),
    );
  }
}
