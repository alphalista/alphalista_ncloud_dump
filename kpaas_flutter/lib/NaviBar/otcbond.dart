import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

class OtcBondPage extends StatefulWidget {
  @override
  _OtcBondPageState createState() => _OtcBondPageState();
}

class _OtcBondPageState extends State<OtcBondPage> {
  late OtcBondDataSource otcBondDataSource;

  @override
  void initState() {
    super.initState();
    otcBondDataSource = OtcBondDataSource(data: getBondData());
  }

  List<OtcBond> getBondData() {
    return [
      OtcBond('채권 A', 'AAA', '1234', '5.0%', '2025-12-31'),
      OtcBond('채권 B', 'AA', '2345', '4.2%', '2027-06-15'),
      OtcBond('채권 C', 'A', '3456', '3.8%', '2024-03-21'),
      OtcBond('채권 D', 'BBB', '4567', '6.5%', '2026-09-10'),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SfDataGrid(
        source: otcBondDataSource,
        columns: [
          GridColumn(
            columnName: 'Name',
            minimumWidth: 100,
            label: Container(
              alignment: Alignment.center,
              child: Text('채권명'),
            ),
          ),
          GridColumn(
            columnName: 'Bond Ranking',
            label: Container(
              alignment: Alignment.center,
              child: Text('채권 위험도'),
            ),
          ),
          GridColumn(
            columnName: 'Category',
            label: Container(
              alignment: Alignment.center,
              child: Text('잔존 수량'),
            ),
          ),
          GridColumn(
            columnName: 'Profit',
            label: Container(
              alignment: Alignment.center,
              child: Text('세후 수익률'),
            ),
          ),
          GridColumn(
            columnName: 'Due Date',
            minimumWidth: 110,
            label: Container(
              alignment: Alignment.center,
              child: Text('만기일'),
            ),
          ),
        ],
      ),
    );
  }
}

class OtcBond {
  OtcBond(this.name, this.category, this.profit, this.creditRanking, this.dueDate);

  final String name;
  final String category;
  final String profit;
  final String creditRanking;
  final String dueDate;
}

class OtcBondDataSource extends DataGridSource {
  OtcBondDataSource({required List<OtcBond> data}) {
    dataGridRows = data
        .map<DataGridRow>((otcBond) => DataGridRow(cells: [
      DataGridCell<String>(columnName: 'Name', value: otcBond.name),
      DataGridCell<String>(columnName: 'Category', value: otcBond.category),
      DataGridCell<String>(columnName: 'Profit', value: otcBond.profit),
      DataGridCell<String>(columnName: 'Credit Ranking', value: otcBond.creditRanking),
      DataGridCell<String>(columnName: 'Due Date', value: otcBond.dueDate),
    ]))
        .toList();
  }

  List<DataGridRow> dataGridRows = [];

  @override
  List<DataGridRow> get rows => dataGridRows;

  @override
  DataGridRowAdapter buildRow(DataGridRow row) {
    return DataGridRowAdapter(cells: [
      Center(
        child: Text(row.getCells()[0].value.toString()),
      ),
      Center(
        child: Text(row.getCells()[1].value.toString()),
      ),
      Center(
        child: Text(row.getCells()[2].value.toString()),
      ),
      Center(
        child: Text(row.getCells()[3].value.toString()),
      ),
      Center(
        child: Text(row.getCells()[4].value.toString()),
      ),
    ]);
  }
}
