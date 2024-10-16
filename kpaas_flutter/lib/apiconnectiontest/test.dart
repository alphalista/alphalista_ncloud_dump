import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'data_controller.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final DataController dataController = Get.put(DataController());

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Market Bond Data'),
        ),
        body: Obx(() {
          if (dataController.isLoading.value) {
            return Center(child: CircularProgressIndicator());
          }
          if (dataController.market_bond_issue_info.isEmpty && dataController.market_bond_inquire_daily_price.isEmpty) {
            return Center(child: Text('No Data Available'));
          }

          // 유효한 인덱스 확인 후 데이터 접근
          int index1 = 0;  // 원하는 인덱스값
          int index2 = 0;  // 원하는 인덱스값

          if (dataController.market_bond_issue_info.length > index1 &&
              dataController.market_bond_inquire_daily_price.length > index2) {
            var data1 = dataController.market_bond_issue_info[index1];  // market_bond_issue_info의 특정 인덱스 값
            var data2 = dataController.market_bond_inquire_daily_price[index2];  // market_bond_inquire_daily_price의 특정 인덱스 값

            return SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Data from market_bond_issue_info at index $index1:'),
                  Text('Code: ${data1['code'] ?? 'Unknown Code'}'),
                  Text('Product Name: ${data1['prdt_name'] ?? 'N/A'}'),

                  SizedBox(height: 20),

                  Text('Data from market_bond_inquire_daily_price at index $index2:'),
                  Text('Stock Bsop Date: ${data2['stck_bsop_date'] ?? 'N/A'}'),
                  Text('Bond Prpr: ${data2['bond_prpr'] ?? 'N/A'}'),
                  Text('Accumulated Volume: ${data2['acml_vol'] ?? 'N/A'}'),
                ],
              ),
            );
          } else {
            return Center(child: Text('Invalid index or no data available at specified index.'));
          }
        }),
      ),
    );
  }
}
