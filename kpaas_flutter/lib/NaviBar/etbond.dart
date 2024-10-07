import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

class EtBondPage extends StatefulWidget {
  const EtBondPage({super.key});

  @override
  _EtBondPageState createState() => _EtBondPageState();
}

class _EtBondPageState extends State<EtBondPage> {
  late EtBondDataSource etBondDataSource;

  @override
  void initState() {
    super.initState();
    etBondDataSource = EtBondDataSource(data: getBondData());
  }

  List<EtBond> getBondData() {
    return [
      EtBond('채권 A', '1234', '5.0%', '2025-12-31'),
      EtBond('채권 B', '2345', '4.2%', '2027-06-15'),
      EtBond('채권 C', '3456', '3.8%', '2024-03-21'),
      EtBond('채권 D', '4567', '6.5%', '2026-09-10'),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SfDataGrid(
        source: etBondDataSource,
        columns: [
          GridColumn(
            columnName: 'Name',
            minimumWidth: 120,
            label: Container(
              alignment: Alignment.center,
              child: const Text('채권명'),
            ),
          ),
          GridColumn(
            columnName: 'Remainder',
            minimumWidth: 120,
            label: Container(
              alignment: Alignment.center,
              child: const Text('잔존 수량'),
            ),
          ),
          GridColumn(
            columnName: 'Profit',
            minimumWidth: 120,
            label: Container(
              alignment: Alignment.center,
              child: const Text('세후 수익률'),
            ),
          ),
          GridColumn(
            columnName: 'Due Date',
            minimumWidth: 120,
            label: Container(
              alignment: Alignment.center,
              child: const Text('만기일'),
            ),
          ),
        ],
      ),
    );
  }
}

class EtBond {
  EtBond(this.name, this.remainder, this.profit, this.dueDate);

  final String name;
  final String remainder;
  final String profit;
  final String dueDate;
}

class EtBondDataSource extends DataGridSource {
  EtBondDataSource({required List<EtBond> data}) {
    dataGridRows = data
        .map<DataGridRow>((etBond) => DataGridRow(cells: [
      DataGridCell<String>(columnName: 'Name', value: etBond.name),
      DataGridCell<String>(columnName: 'Remainder', value: etBond.remainder),
      DataGridCell<String>(columnName: 'Profit', value: etBond.profit),
      DataGridCell<String>(columnName: 'Due Date', value: etBond.dueDate),
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
    ]);
  }
}
