import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TrendEtBondDataSource? trendEtBondDataSource;
  TrendOtcBondDataSource? trendOtcBondDataSource;
  bool showTrendEtBond = true;

  InterestEtBondDataSource? interestEtBondDataSource;
  InterestOtcBondDataSource? interestOtcBondDataSource;
  bool showInterestEtBond = true;

  final List<Map<String, String>> dummyNews = [
    {
      'title': 'Breaking News: Flutter 3.0 Released!',
      'description': 'Flutter 3.0 is packed with new features, performance improvements, and more.',
      'pubDate': 'October 3, 2024',
    },
    {
      'title': 'Tech Giants Join Forces',
      'description': 'Major tech companies are collaborating on a new AI initiative to improve global connectivity.',
      'pubDate': 'October 2, 2024',
    },
    {
      'title': 'Stock Market Hits Record High',
      'description': 'The stock market reaches new heights amid optimism about economic recovery.',
      'pubDate': 'October 1, 2024',
    },
  ];

  @override
  void initState() {
    super.initState();
    // 데이터 초기화
    trendEtBondDataSource = TrendEtBondDataSource(data: getTrendEtBondData());
    trendOtcBondDataSource = TrendOtcBondDataSource(data: getTrendOtcBondData());
    interestEtBondDataSource = InterestEtBondDataSource(data: getInterestEtBondData());
    interestOtcBondDataSource = InterestOtcBondDataSource(data: getInterestOtcBondData());
  }

  List<EtBond> getTrendEtBondData() {
    return [
      EtBond('채권 A', '1234', '5.0%', '2025-12-31'),
      EtBond('채권 B', '2345', '4.2%', '2027-06-15'),
      EtBond('채권 C', '3456', '3.8%', '2024-03-21'),
      EtBond('채권 D', '4567', '6.5%', '2026-09-10'),
    ];
  }

  List<OtcBond> getTrendOtcBondData() {
    return [
      OtcBond('채권 A', 'AAA', '1234', '5.0%', '2025-12-31'),
      OtcBond('채권 B', 'AA', '2345', '4.2%', '2027-06-15'),
      OtcBond('채권 C', 'A', '3456', '3.8%', '2024-03-21'),
      OtcBond('채권 D', 'BBB', '4567', '6.5%', '2026-09-10'),
    ];
  }

  List<EtBond> getInterestEtBondData() {
    return [
      EtBond('채권 1', '1234', '15.0%', '2025-12-31'),
      EtBond('채권 2', '2345', '14.2%', '2027-06-15'),
      EtBond('채권 3', '3456', '13.8%', '2024-03-21'),
      EtBond('채권 4', '4567', '16.5%', '2026-09-10'),
    ];
  }

  List<OtcBond> getInterestOtcBondData() {
    return [
      OtcBond('채권 1', 'AAA', '1234', '15.0%', '2025-12-31'),
      OtcBond('채권 2', 'AA', '2345', '14.2%', '2027-06-15'),
      OtcBond('채권 3', 'A', '3456', '13.8%', '2024-03-21'),
      OtcBond('채권 4', 'BBB', '4567', '16.5%', '2026-09-10'),
    ];
  }

  @override
  Widget build(BuildContext context) {
    // 데이터소스가 초기화되지 않았을 경우 로딩 화면 표시
    if (trendEtBondDataSource == null || trendOtcBondDataSource == null || interestEtBondDataSource == null || interestOtcBondDataSource == null) {
      return const Scaffold(
        body: Center(
          child: CircularProgressIndicator(),
        ),
      );
    }

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 20,),
            const Text('트렌딩 장내 / 장외 채권',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      showTrendEtBond = true;
                    });
                  },
                  child: const Text('장내채권 보기'),
                ),
                const SizedBox(width: 20), // 두 버튼 사이의 여백
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      showTrendEtBond = false;
                    });
                  },
                  child: const Text('장외채권 보기'),
                ),
              ],
            ),
            const SizedBox(height: 20), // 버튼과 테이블 사이의 여백
            SizedBox(
              height: 202.5,
              child: SfDataGrid(
                source: showTrendEtBond ? trendEtBondDataSource! : trendOtcBondDataSource!,
                columns: showTrendEtBond
                    ? [
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
                ]
                    : [
                  GridColumn(
                    columnName: 'Name',
                    minimumWidth: 100,
                    label: Container(
                      alignment: Alignment.center,
                      child: const Text('채권명'),
                    ),
                  ),
                  GridColumn(
                    columnName: 'Bond Ranking',
                    label: Container(
                      alignment: Alignment.center,
                      child: const Text('채권 위험도'),
                    ),
                  ),
                  GridColumn(
                    columnName: 'Remainder',
                    label: Container(
                      alignment: Alignment.center,
                      child: const Text('잔존 수량'),
                    ),
                  ),
                  GridColumn(
                    columnName: 'Profit',
                    label: Container(
                      alignment: Alignment.center,
                      child: const Text('세후 수익률'),
                    ),
                  ),
                  GridColumn(
                    columnName: 'Due Date',
                    minimumWidth: 110,
                    label: Container(
                      alignment: Alignment.center,
                      child: const Text('만기일'),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20,), // 추가 버튼 및 표 간의 여백
            const Text('관심 장내 / 장외 채권',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      showInterestEtBond = true;
                    });
                  },
                  child: const Text('장내채권 보기'),
                ),
                const SizedBox(width: 20), // 두 버튼 사이의 여백
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      showInterestEtBond = false;
                    });
                  },
                  child: const Text('장외채권 보기'),
                ),
              ],
            ),
            const SizedBox(height: 20), // 버튼과 테이블 사이의 여백
            SizedBox(
              height: 202.5,
              child: SfDataGrid(
                source: showInterestEtBond ? interestEtBondDataSource! : interestOtcBondDataSource!,
                columns: showInterestEtBond
                    ? [
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
                ]
                    : [
                  GridColumn(
                    columnName: 'Name',
                    minimumWidth: 100,
                    label: Container(
                      alignment: Alignment.center,
                      child: const Text('채권명'),
                    ),
                  ),
                  GridColumn(
                    columnName: 'Bond Ranking',
                    label: Container(
                      alignment: Alignment.center,
                      child: const Text('채권 위험도'),
                    ),
                  ),
                  GridColumn(
                    columnName: 'Remainder',
                    label: Container(
                      alignment: Alignment.center,
                      child: const Text('잔존 수량'),
                    ),
                  ),
                  GridColumn(
                    columnName: 'Profit',
                    label: Container(
                      alignment: Alignment.center,
                      child: const Text('세후 수익률'),
                    ),
                  ),
                  GridColumn(
                    columnName: 'Due Date',
                    minimumWidth: 110,
                    label: Container(
                      alignment: Alignment.center,
                      child: const Text('만기일'),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 20),
                  const Center(
                    child: Text('트렌딩 뉴스',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  ListView.builder(
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,  // Make ListView fit inside Column
                    itemCount: dummyNews.length,
                    itemBuilder: (context, index) {
                      final newsItem = dummyNews[index];
                      return Card(
                        margin: EdgeInsets.all(10),
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                newsItem['title']!,
                                style: const TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(height: 10),
                              Text(
                                newsItem['description']!,
                                style: const TextStyle(fontSize: 16),
                              ),
                              const SizedBox(height: 10),
                              Text(
                                'Published on: ${newsItem['pubDate']!}',
                                style: const TextStyle(
                                  fontSize: 14,
                                  fontStyle: FontStyle.italic,
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// EtBond 클래스 및 DataSource
class EtBond {
  EtBond(this.name, this.remainder, this.profit, this.dueDate);

  final String name;
  final String remainder;
  final String profit;
  final String dueDate;
}

// OtcBond 클래스 추가
class OtcBond {
  OtcBond(this.name, this.bondRanking, this.remainder, this.profit, this.dueDate);

  final String name;
  final String bondRanking;
  final String remainder;
  final String profit;
  final String dueDate;
}

// 트렌드 데이터소스
class TrendEtBondDataSource extends DataGridSource {
  TrendEtBondDataSource({required List<EtBond> data}) {
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
      Center(child: Text(row.getCells()[0].value.toString())),
      Center(child: Text(row.getCells()[1].value.toString())),
      Center(child: Text(row.getCells()[2].value.toString())),
      Center(child: Text(row.getCells()[3].value.toString())),
    ]);
  }
}

// 트렌드 장외 데이터소스
class TrendOtcBondDataSource extends DataGridSource {
  TrendOtcBondDataSource({required List<OtcBond> data}) {
    dataGridRows = data
        .map<DataGridRow>((otcBond) => DataGridRow(cells: [
      DataGridCell<String>(columnName: 'Name', value: otcBond.name),
      DataGridCell<String>(columnName: 'Bond Ranking', value: otcBond.bondRanking),
      DataGridCell<String>(columnName: 'Remainder', value: otcBond.remainder),
      DataGridCell<String>(columnName: 'Profit', value: otcBond.profit),
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
      Center(child: Text(row.getCells()[0].value.toString())),
      Center(child: Text(row.getCells()[1].value.toString())),
      Center(child: Text(row.getCells()[2].value.toString())),
      Center(child: Text(row.getCells()[3].value.toString())),
      Center(child: Text(row.getCells()[4].value.toString())),
    ]);
  }
}

// 관심 데이터소스
class InterestEtBondDataSource extends DataGridSource {
  InterestEtBondDataSource({required List<EtBond> data}) {
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
      Center(child: Text(row.getCells()[0].value.toString())),
      Center(child: Text(row.getCells()[1].value.toString())),
      Center(child: Text(row.getCells()[2].value.toString())),
      Center(child: Text(row.getCells()[3].value.toString())),
    ]);
  }
}

class InterestOtcBondDataSource extends DataGridSource {
  InterestOtcBondDataSource({required List<OtcBond> data}) {
    dataGridRows = data
        .map<DataGridRow>((otcBond) => DataGridRow(cells: [
      DataGridCell<String>(columnName: 'Name', value: otcBond.name),
      DataGridCell<String>(columnName: 'Bond Ranking', value: otcBond.bondRanking),
      DataGridCell<String>(columnName: 'Remainder', value: otcBond.remainder),
      DataGridCell<String>(columnName: 'Profit', value: otcBond.profit),
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
      Center(child: Text(row.getCells()[0].value.toString())),
      Center(child: Text(row.getCells()[1].value.toString())),
      Center(child: Text(row.getCells()[2].value.toString())),
      Center(child: Text(row.getCells()[3].value.toString())),
      Center(child: Text(row.getCells()[4].value.toString())),
    ]);
  }
}
