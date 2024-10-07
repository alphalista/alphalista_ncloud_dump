import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'data_controller.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final DataController dataController = Get.put(DataController());

  @override
  Widget build(BuildContext context) {
    return MaterialApp( // MaterialApp을 추가해야 합니다.
      home: Scaffold(
        appBar: AppBar(
          title: Text('Data List'),
        ),
        body: Obx(() {
          if (dataController.isLoading.value) {
            return Center(child: CircularProgressIndicator());
          }
          return ListView.builder(
            itemCount: dataController.dataList.length,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text(dataController.dataList[index]['title']), // API 데이터의 예시 필드
              );
            },
          );
        }),
      ),
    );
  }
}
