import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: const EtBondDescriptionPage(),
    theme: ThemeData(
      primarySwatch: Colors.blue,
    ),
  ));
}

class EtBondDescriptionPage extends StatefulWidget {
  const EtBondDescriptionPage({Key? key}) : super(key: key);

  @override
  _EtBondDescriptionPageState createState() => _EtBondDescriptionPageState();
}

class _EtBondDescriptionPageState extends State<EtBondDescriptionPage> {
  // 선택 상태 관리 변수
  String selectedText = '정보';
  String selectedChart = '시가';
  String selectedPeriod = '주별';

  late List<QuoteData> quoteData;
  late QuoteDataSource quoteDataSource;

  List<String> leftColumnData = ['발행일', '만기일', '채권 종류', '위험도', '이자 지급 구분', '차기 이자 지급일', '이자 지급 주기'];
  List<String> rightColumnData = ['23.12.17', '54.12.05', '국채', '무위험', '복리채', '24.11.03', '1개월'];

  final List<String> profitLeftColumnData = ['이자율', '세전 수익률', '세후 수익률', '예상 수익금'];
  final List<String> profitRightColumnData = ['4.63%', '3.94%', '3.27%', '12402.0'];

  final List<_ChartData> weeklyMarketPriceData = [
    _ChartData('일', 9410),
    _ChartData('월', 9370),
    _ChartData('화', 9381),
    _ChartData('수', 9354),
    _ChartData('목', 9402),
    _ChartData('금', 9362),
    _ChartData('토', 9287),
  ];

  final List<_ChartData> monthlyMarketPriceData = [
    _ChartData('11월', 10580),
    _ChartData('12월', 10614),
    _ChartData('1월', 10627),
    _ChartData('2월', 10611),
    _ChartData('3월', 10631),
    _ChartData('4월', 10602),
    _ChartData('5월', 10619),
    _ChartData('6월', 10616),
    _ChartData('7월', 10598),
    _ChartData('8월', 10603),
    _ChartData('9월', 10635),
    _ChartData('10월', 10590),
  ];

  final List<_ChartData> weeklyDurationData = [
    _ChartData('일', 6.83),
    _ChartData('월', 6.68),
    _ChartData('화', 6.56),
    _ChartData('수', 6.24),
    _ChartData('목', 6.08),
    _ChartData('금', 5.79),
    _ChartData('토', 5.67),
  ];

  final List<_ChartData> monthlyDurationData = [
    _ChartData('11월', 7.68),
    _ChartData('12월', 7.48),
    _ChartData('1월', 7.21),
    _ChartData('2월', 7.47),
    _ChartData('3월', 7.34),
    _ChartData('4월', 7.5),
    _ChartData('5월', 7.74),
    _ChartData('6월', 7.95),
    _ChartData('7월', 7.57),
    _ChartData('8월', 7.4),
    _ChartData('9월', 7.61),
    _ChartData('10월', 7.39),
  ];

  List<_ChartData> chartData = [];

  @override
  void initState() {
    super.initState();
    chartData = weeklyMarketPriceData;
    quoteData = getQuoteData();
    quoteDataSource = QuoteDataSource(quoteData);
  }

  // 텍스트 데이터 변경 함수
  void _updateTextContent(String type) {
    setState(() {
      selectedText = type;
      if (type == '정보') {
        leftColumnData = ['발행일', '만기일', '채권 종류', '위험도', '이자 지급 구분', '차기 이자 지급일', '이자 지급 주기'];
        rightColumnData = ['23.12.17', '54.12.05', '국채', '무위험', '복리채', '24.11.03', '1개월'];
      } else if (type == '수익') {
        leftColumnData = profitLeftColumnData;
        rightColumnData = profitRightColumnData;
      }
    });
  }

  // 기간과 차트 데이터 변경 함수
  void _updateChartData(String type) {
    setState(() {
      selectedChart = type;
      if (type == '시가') {
        chartData = selectedPeriod == '주별' ? weeklyMarketPriceData : monthlyMarketPriceData;
      } else if (type == '듀레이션') {
        chartData = selectedPeriod == '주별' ? weeklyDurationData : monthlyDurationData;
      }
    });
  }

  void _updatePeriod(String period) {
    setState(() {
      selectedPeriod = period;
      _updateChartData(selectedChart);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: Center(
        child: Container(
          width: 500,
          color: const Color(0xFFF1F1F9),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                color: Colors.white,
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                alignment: Alignment.center,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween, // 좌우에 붙이기 위해 설정
                  children: [
                    // 왼쪽 영역 (백 버튼 + 타이틀)
                    const Row(
                      children: [
                        const SizedBox(width: 10,),
                        BackButton(),
                        Text(
                          '장내채권',
                          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        IconButton(
                          icon: const Icon(Icons.add),
                          onPressed: () {
                            showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                String? buttonText;
                                int currentPage = 0; // 현재 페이지 상태
                                bool showFinalMessage = false; // 최종 메시지 표시 여부

                                // 각 페이지별 TextEditingController 선언
                                TextEditingController firstController = TextEditingController();
                                TextEditingController secondController = TextEditingController();
                                TextEditingController thirdController = TextEditingController();

                                return StatefulBuilder(
                                  builder: (context, setState) {
                                    return Dialog(
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(15),
                                      ),
                                      child: Container(
                                        width: 470,
                                        height: 150,
                                        padding: const EdgeInsets.all(8.0),
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius: BorderRadius.circular(15),
                                        ),
                                        child: Center(
                                          child: buttonText == null
                                              ? Column(
                                            mainAxisSize: MainAxisSize.min,
                                            children: [
                                              if (!showFinalMessage)
                                                const Text(
                                                  '어디에 추가할까요?',
                                                  style: TextStyle(
                                                      fontSize: 20,
                                                      fontWeight: FontWeight.bold,
                                                      color: Colors.black),
                                                ),
                                              const SizedBox(height: 20),
                                              if (!showFinalMessage)
                                                Row(
                                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                                  children: [
                                                    TextButton(
                                                      onPressed: () {
                                                        setState(() {
                                                          buttonText = "추가되었습니다!\n마이페이지의 '관심 채권'을 확인하세요!";
                                                        });
                                                      },
                                                      style: ButtonStyle(
                                                        foregroundColor: MaterialStateProperty.resolveWith<Color>(
                                                              (Set<MaterialState> states) {
                                                            return states.contains(MaterialState.hovered) ? Colors.white : Colors.black;
                                                          },
                                                        ),
                                                        backgroundColor: MaterialStateProperty.resolveWith<Color>(
                                                              (Set<MaterialState> states) {
                                                            return states.contains(MaterialState.hovered) ? Colors.blueAccent : Colors.white;
                                                          },
                                                        ),
                                                        shape: MaterialStateProperty.all(
                                                          RoundedRectangleBorder(
                                                            borderRadius: BorderRadius.circular(8),
                                                            side: const BorderSide(color: Colors.blue),
                                                          ),
                                                        ),
                                                        minimumSize: MaterialStateProperty.all(const Size(150, 40)),
                                                      ),
                                                      child: const Text('관심 채권'),
                                                    ),
                                                    TextButton(
                                                      onPressed: () {
                                                        setState(() {
                                                          currentPage = 0;
                                                          showFinalMessage = true;
                                                        });
                                                      },
                                                      style: ButtonStyle(
                                                        foregroundColor: MaterialStateProperty.resolveWith<Color>(
                                                              (Set<MaterialState> states) {
                                                            return states.contains(MaterialState.hovered) ? Colors.white : Colors.black;
                                                          },
                                                        ),
                                                        backgroundColor: MaterialStateProperty.resolveWith<Color>(
                                                              (Set<MaterialState> states) {
                                                            return states.contains(MaterialState.hovered) ? Colors.blueAccent : Colors.white;
                                                          },
                                                        ),
                                                        shape: MaterialStateProperty.all(
                                                          RoundedRectangleBorder(
                                                            borderRadius: BorderRadius.circular(8),
                                                            side: const BorderSide(color: Colors.blue),
                                                          ),
                                                        ),
                                                        minimumSize: MaterialStateProperty.all(const Size(150, 40)),
                                                      ),
                                                      child: const Text('보유 채권'),
                                                    ),
                                                  ],
                                                ),
                                              if (showFinalMessage)
                                                Column(
                                                  mainAxisSize: MainAxisSize.min,
                                                  children: [
                                                    if (currentPage == 0)
                                                      Column(
                                                        children: [
                                                          const Text(
                                                            '얼마나 추가할까요?',
                                                            style: TextStyle(
                                                              fontSize: 20,
                                                              fontWeight: FontWeight.bold,
                                                              color: Colors.black,
                                                            ),
                                                          ),
                                                          const SizedBox(height: 10),
                                                          Padding(
                                                            padding: const EdgeInsets.symmetric(horizontal: 40),
                                                            child: TextField(
                                                              controller: firstController, // 첫 번째 페이지 컨트롤러
                                                              decoration: const InputDecoration(
                                                                labelText: '구매 갯수',
                                                                hintText: '예: 1000',
                                                                border: UnderlineInputBorder(),
                                                              ),
                                                              onSubmitted: (value) {
                                                                firstController.clear(); // 값 초기화
                                                                setState(() {
                                                                  currentPage++; // 다음 페이지로 이동
                                                                });
                                                              },
                                                            ),
                                                          ),
                                                        ],
                                                      )
                                                    else if (currentPage == 1)
                                                      Column(
                                                        children: [
                                                          const Text(
                                                            '얼마에 구매하셨나요?',
                                                            style: TextStyle(
                                                              fontSize: 20,
                                                              fontWeight: FontWeight.bold,
                                                              color: Colors.black,
                                                            ),
                                                          ),
                                                          const SizedBox(height: 10),
                                                          Padding(
                                                            padding: const EdgeInsets.symmetric(horizontal: 40),
                                                            child: TextField(
                                                              controller: secondController, // 두 번째 페이지 컨트롤러
                                                              decoration: const InputDecoration(
                                                                labelText: '구매 가격',
                                                                hintText: '예: 10000',
                                                                border: UnderlineInputBorder(),
                                                              ),
                                                              onSubmitted: (value) {
                                                                secondController.clear(); // 값 초기화
                                                                setState(() {
                                                                  currentPage++; // 다음 페이지로 이동
                                                                });
                                                              },
                                                            ),
                                                          ),
                                                        ],
                                                      )
                                                    else if (currentPage == 2)
                                                        Column(
                                                          children: [
                                                            const Text(
                                                              '언제 구매하셨나요?',
                                                              style: TextStyle(
                                                                fontSize: 20,
                                                                fontWeight: FontWeight.bold,
                                                                color: Colors.black,
                                                              ),
                                                            ),
                                                            const SizedBox(height: 10),
                                                            Padding(
                                                              padding: const EdgeInsets.symmetric(horizontal: 40),
                                                              child: TextField(
                                                                controller: thirdController, // 세 번째 페이지 컨트롤러
                                                                decoration: const InputDecoration(
                                                                  labelText: '구매 날짜',
                                                                  hintText: 'YYYY-MM-DD',
                                                                  border: UnderlineInputBorder(),
                                                                ),
                                                                onSubmitted: (value) {
                                                                  thirdController.clear(); // 값 초기화
                                                                  setState(() {
                                                                    buttonText = "추가되었습니다!\n마이페이지의 '보유 채권'을 확인하세요!";
                                                                  });
                                                                },
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                  ],
                                                ),
                                            ],
                                          )
                                              : Text(
                                            buttonText!,
                                            style: const TextStyle(
                                              fontSize: 20,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.black,
                                              height: 1.5,
                                            ),
                                            textAlign: TextAlign.center,
                                          ),
                                        ),
                                      ),
                                    );
                                  },
                                );
                              },
                            );
                          },
                        ),
                        const Text(
                          '추가',
                          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black),
                        ),
                        const SizedBox(width: 20,),
                      ],
                    ),
                  ],
                ),
              ),
              Container(
                margin: const EdgeInsets.all(16.0),
                padding: const EdgeInsets.all(16.0),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 0,
                      blurRadius: 6,
                      offset: const Offset(0, 3),
                    ),
                  ],
                ),
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '국민주택1종23-02',
                          style: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 35),
                        Text(
                          "(KR101501DD21)",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    Align(
                      alignment: Alignment.bottomRight,
                      child: Text(
                        "9410.0",
                        style: TextStyle(
                          fontSize: 35,
                          fontWeight: FontWeight.bold,
                          color: Colors.red,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Row(
                  children: [
                    GestureDetector(
                      onTap: () => _updateTextContent('정보'),
                      child: Text(
                        '정보',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: selectedText == '정보' ? Colors.black : Colors.grey,
                        ),
                      ),
                    ),
                    const SizedBox(width: 10),
                    GestureDetector(
                      onTap: () => _updateTextContent('호가'),
                      child: Text(
                        '호가',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: selectedText == '호가' ? Colors.black : Colors.grey,
                        ),
                      ),
                    ),
                    const SizedBox(width: 10),
                    GestureDetector(
                      onTap: () => _updateTextContent('수익'),
                      child: Text(
                        '수익',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: selectedText == '수익' ? Colors.black : Colors.grey,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                height: 240,
                margin: const EdgeInsets.all(16.0),
                padding: const EdgeInsets.all(16.0),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 0,
                      blurRadius: 6,
                      offset: const Offset(0, 3),
                    ),
                  ],
                ),
                child: selectedText == '호가'
                    ? SfDataGrid(
                      source: QuoteDataSource(quoteData),
                      columnWidthMode: ColumnWidthMode.fill,
                      gridLinesVisibility: GridLinesVisibility.none,
                      headerGridLinesVisibility: GridLinesVisibility.none,
                      headerRowHeight: 30,
                      rowHeight: 22.0,
                      columns: <GridColumn>[
                    GridColumn(
                        columnName: '매도 수익율',
                        label: Container(
                            padding: EdgeInsets.zero,
                            alignment: Alignment.center,
                            child: const Text(
                              '매도 수익율',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ))),
                    GridColumn(
                        columnName: '매도 잔량',
                        label: Container(
                            padding: EdgeInsets.zero,
                            alignment: Alignment.center,
                            child: const Text(
                              '매도 잔량',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ))),
                    GridColumn(
                        columnName: '호가',
                        label: Container(
                            padding: EdgeInsets.zero,
                            alignment: Alignment.center,
                            child: const Text(
                              '호가',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ))),
                    GridColumn(
                        columnName: '매수 잔량',
                        label: Container(
                            padding: EdgeInsets.zero,
                            alignment: Alignment.center,
                            child: const Text(
                              '매수 잔량',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ))),
                    GridColumn(
                        columnName: '매수 수익율',
                        label: Container(
                            padding: EdgeInsets.zero,
                            alignment: Alignment.center,
                            child: const Text(
                              '매수 수익율',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ))),
                                      ],
                                    )
                : Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: leftColumnData
                            .map((item) => Padding(
                          padding: const EdgeInsets.symmetric(vertical: 3.0),
                          child: Text(item, style: const TextStyle(fontSize: 15)),
                        ))
                            .toList(),
                      ),
                    ),
                    Align(
                      alignment: Alignment.centerRight,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: rightColumnData
                            .map((item) => Padding(
                          padding: const EdgeInsets.symmetric(vertical: 3.0),
                          child: Text(item, style: const TextStyle(fontSize: 15)),
                        ))
                            .toList(),
                      ),
                    ),
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween, // Row 간의 공간을 균등하게 분배
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: Row(
                      children: [
                        GestureDetector(
                          onTap: () {
                            _updateChartData('시가');
                          },
                          child: Text(
                            '시가',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: selectedChart == '시가' ? Colors.black : Colors.grey,
                            ),
                          ),
                        ),
                        const SizedBox(width: 10),
                        GestureDetector(
                          onTap: () {
                            _updateChartData('듀레이션');
                          },
                          child: Text(
                            '듀레이션',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: selectedChart == '듀레이션' ? Colors.black : Colors.grey,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: Row(
                      children: [
                        GestureDetector(
                          onTap: () => _updatePeriod('주별'),
                          child: Text(
                            '주별',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: selectedPeriod == '주별' ? Colors.black : Colors.grey,
                            ),
                          ),
                        ),
                        const SizedBox(width: 10),
                        GestureDetector(
                          onTap: () => _updatePeriod('월별'),
                          child: Text(
                            '월별',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: selectedPeriod == '월별' ? Colors.black : Colors.grey,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Expanded(
                child: Container(
                  margin: const EdgeInsets.all(16.0),
                  padding: const EdgeInsets.all(16.0),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 0,
                        blurRadius: 6,
                        offset: const Offset(0, 3),
                      ),
                    ],
                  ),
                  child: SfCartesianChart(
                    primaryXAxis: CategoryAxis(),
                    series: <ChartSeries>[
                      LineSeries<_ChartData, String>(
                        dataSource: chartData,
                        xValueMapper: (_ChartData data, _) => data.label,
                        yValueMapper: (_ChartData data, _) => data.value,
                        markerSettings: const MarkerSettings(isVisible: true),
                        color: Colors.blue,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
  List<QuoteData> getQuoteData() {
    return [
      QuoteData('6.415', '67000', '10025.0', '', ''),
      QuoteData('6.422', '25677', '10024.0', '', ''),
      QuoteData('6.424', '115000', '10023.0', '', ''),
      QuoteData('6.430', '28945', '10020.0', '', ''),
      QuoteData('', '', '10019.9', '93', '6.439'),
      QuoteData('', '', '10019.0', '2200', '6.445'),
      QuoteData('', '', '10018.9', '6000', '6.450'),
      QuoteData('', '', '10018.8', '200', '6.451'),
    ];
  }
}


class QuoteData {
  QuoteData(this.sellProfit, this.sellAmount, this.price, this.buyAmount, this.buyProfit);
  final String sellProfit;
  final String sellAmount;
  final String price;
  final String buyAmount;
  final String buyProfit;
}

class QuoteDataSource extends DataGridSource {
  QuoteDataSource(List<QuoteData> quoteData) {
    dataGridRows = quoteData
        .map<DataGridRow>((data) => DataGridRow(cells: [
      DataGridCell<String>(columnName: '매도 수익율', value: data.sellProfit),
      DataGridCell<String>(columnName: '매도 잔량', value: data.sellAmount),
      DataGridCell<String>(columnName: '호가', value: data.price),
      DataGridCell<String>(columnName: '매수 잔량', value: data.buyAmount),
      DataGridCell<String>(columnName: '매수 수익율', value: data.buyProfit),
    ]))
        .toList();
  }

  List<DataGridRow> dataGridRows = [];

  @override
  List<DataGridRow> get rows => dataGridRows;

  @override
  DataGridRowAdapter buildRow(DataGridRow row) {
    return DataGridRowAdapter(cells: row.getCells().map<Widget>((dataGridCell) {
      return Container(
        padding: const EdgeInsets.all(0.0),
        alignment: Alignment.center,
        child: Text(dataGridCell.value.toString()),
      );
    }).toList());
  }
}

class _ChartData {
  _ChartData(this.label, this.value);
  final String label;
  final double value;
}