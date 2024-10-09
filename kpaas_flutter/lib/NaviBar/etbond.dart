import 'package:flutter/material.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:kpaas_flutter/MyPage/myPage_main.dart';

class EtBondPage extends StatefulWidget {
  @override
  _EtBondPageState createState() => _EtBondPageState();
}

class _EtBondPageState extends State<EtBondPage> {
  static const _pageSize = 20;

  final PagingController<int, String> _pagingController = PagingController(firstPageKey: 0);

  @override
  void initState() {
    super.initState();
    _pagingController.addPageRequestListener((pageKey) {
      _fetchPage(pageKey);
    });
  }

  Future<void> _fetchPage(int pageKey) async {
    try {
      final newItems = List.generate(_pageSize, (index) => 'Item ${(pageKey * _pageSize) + index}');
      final isLastPage = newItems.length < _pageSize;
      if (isLastPage) {
        _pagingController.appendLastPage(newItems);
      } else {
        final nextPageKey = pageKey + 1;
        _pagingController.appendPage(newItems, nextPageKey);
      }
    } catch (error) {
      _pagingController.error = error;
    }
  }

  @override
  void dispose() {
    _pagingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          '장내 채권',
          style: TextStyle(
            fontSize: 24.0,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        backgroundColor: Colors.white,
        scrolledUnderElevation: 0,
        actions: [
          IconButton(
            icon: Icon(Icons.account_circle, color: Colors.black),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => MyPage()), // MyPage로 이동
              );
            },
          ),
        ],
      ),
      body: Container(
        child: CustomScrollView(
          slivers: [
            // 검색창과 버튼을 포함한 SliverAppBar
            SliverAppBar(
              expandedHeight: 150.0,
              floating: true,
              pinned: false,
              backgroundColor: const Color(0xfff6f6f8),
              flexibleSpace: Container(
                color: Color(0xfff6f6f8),
                child: FlexibleSpaceBar(
                  background: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 10.0),
                        child: TextField(
                          decoration: InputDecoration(
                            prefixIcon: Icon(Icons.search),
                            hintText: '검색어를 입력하세요.',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12.0),
                              borderSide: BorderSide.none,
                            ),
                            filled: true,
                            fillColor: Colors.white,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16.0),
                        child: SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            children: [
                              ElevatedButton(
                                onPressed: () {
                                  _showButtonName(context, '전체');
                                },
                                child: Text('전체'),
                              ),
                              SizedBox(width: 13.5),
                              ElevatedButton(
                                onPressed: () {
                                  _showButtonName(context, '위험도');
                                },
                                child: Text('위험도'),
                              ),
                              SizedBox(width: 13.5),
                              ElevatedButton(
                                onPressed: () {
                                  _showButtonName(context, '신용 등급');
                                },
                                child: Text('신용 등급'),
                              ),
                              SizedBox(width: 13.5),
                              ElevatedButton(
                                onPressed: () {
                                  _showButtonName(context, '수익률');
                                },
                                child: Text('수익률'),
                              ),
                              SizedBox(width: 13.5),
                              ElevatedButton(
                                onPressed: () {
                                  _showButtonName(context, '잔존 수량');
                                },
                                child: Text('잔존 수량'),
                              ),
                              SizedBox(width: 13.5),
                              ElevatedButton(
                                onPressed: () {
                                  _showButtonName(context, '만기일');
                                },
                                child: Text('만기일'),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            PagedSliverList<int, String>(
              pagingController: _pagingController,
              builderDelegate: PagedChildBuilderDelegate<String>(
                itemBuilder: (context, item, index) => Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Card(
                    elevation: 4.0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(22.0),
                    ),
                    child: Container(
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(20.0)),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black26,
                            blurRadius: 20.0,
                            offset: Offset(4, 4),
                          ),
                        ],
                      ),
                      child: const SizedBox(
                        height: 250,
                        width: 320,
                        child: ListTile(
                          title: Text(
                            "a24ctr 미국",
                            style: TextStyle(
                              fontSize: 35,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          subtitle: Column(
                            children: [
                              SizedBox(height: 20),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Column(
                                    children: [
                                      Text(
                                        '채권 위험도',
                                        style: TextStyle(
                                          fontSize: 18,
                                          color: Color(0xff696969),
                                        ),
                                      ),
                                      Text(
                                        "B+",
                                        style: TextStyle(
                                          fontSize: 23,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black,
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(width: 40),
                                  Column(
                                    children: [
                                      Text(
                                        '신용 등급',
                                        style: TextStyle(
                                          fontSize: 18,
                                          color: Color(0xff696969),
                                        ),
                                      ),
                                      Text(
                                        "AAA",
                                        style: TextStyle(
                                          fontSize: 23,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black,
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(width: 40),
                                  Column(
                                    children: [
                                      Text(
                                        '세후 수익률',
                                        style: TextStyle(
                                          fontSize: 18,
                                          color: Color(0xff696969),
                                        ),
                                      ),
                                      Text(
                                        "4.2%",
                                        style: TextStyle(
                                          fontSize: 23,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              SizedBox(height: 20),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  SizedBox(width: 27.5),
                                  Column(
                                    children: [
                                      Text(
                                        '잔존 수량',
                                        style: TextStyle(
                                          fontSize: 18,
                                          color: Color(0xff696969),
                                        ),
                                      ),
                                      Text(
                                        "325",
                                        style: TextStyle(
                                          fontSize: 23,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black,
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(width: 40),
                                  Column(
                                    children: [
                                      Text(
                                        '만기일',
                                        style: TextStyle(
                                          fontSize: 18,
                                          color: Color(0xff696969),
                                        ),
                                      ),
                                      Text(
                                        "27.03.02",
                                        style: TextStyle(
                                          fontSize: 23,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black,
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(width: 40),
                                  Column(
                                    children: [
                                      Text(
                                        '발행일',
                                        style: TextStyle(
                                          fontSize: 18,
                                          color: Color(0xff696969),
                                        ),
                                      ),
                                      Text(
                                        "23.02.11",
                                        style: TextStyle(
                                          fontSize: 23,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _showButtonName(BuildContext context, String buttonName) {
    List<Widget> buttonList;
    switch (buttonName) {
      case '전체':
        buttonList = [ElevatedButton(onPressed: () {}, child: Text('Option 1 for 전체'))];
        break;
      case '위험도':
        buttonList = [
          ElevatedButton(onPressed: () {}, child: Text('AAA')),
          ElevatedButton(onPressed: () {}, child: Text('AA')),
          ElevatedButton(onPressed: () {}, child: Text('A')),
          ElevatedButton(onPressed: () {}, child: Text('BBB')),
          ElevatedButton(onPressed: () {}, child: Text('BB')),
          ElevatedButton(onPressed: () {}, child: Text('B')),
          ElevatedButton(onPressed: () {}, child: Text('CCC 이하')),
        ];
        break;
      case '신용 등급':
        buttonList = [
          ElevatedButton(onPressed: () {}, child: Text('AAA')),
          ElevatedButton(onPressed: () {}, child: Text('AA')),
          ElevatedButton(onPressed: () {}, child: Text('A')),
          ElevatedButton(onPressed: () {}, child: Text('BBB')),
          ElevatedButton(onPressed: () {}, child: Text('BB')),
          ElevatedButton(onPressed: () {}, child: Text('B')),
          ElevatedButton(onPressed: () {}, child: Text('CCC 이하')),
        ];
        break;
      case '수익률':
        buttonList = [
          ElevatedButton(onPressed: () {}, child: Text('오름차순')),
          ElevatedButton(onPressed: () {}, child: Text('내림차순')),
        ];
        break;
      case '잔존 수량':
        buttonList = [
          ElevatedButton(onPressed: () {}, child: Text('오름차순')),
          ElevatedButton(onPressed: () {}, child: Text('내림차순')),
        ];
        break;
      case '만기일':
        buttonList = [
          ElevatedButton(onPressed: () {}, child: Text('만기 5년 이내')),
          ElevatedButton(onPressed: () {}, child: Text('만기 3년 이내')),
          ElevatedButton(onPressed: () {}, child: Text('만기 1년 이내')),
          ElevatedButton(onPressed: () {}, child: Text('만기 6개월 이내')),
          ElevatedButton(onPressed: () {}, child: Text('만기 오름차순')),
          ElevatedButton(onPressed: () {}, child: Text('만기 내림차순')),
        ];
        break;
      default:
        buttonList = [];
        break;
    }

    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Container(
          height: 200,
          color: Colors.white,
          child: Center(
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: buttonList,
              ),
            ),
          ),
        );
      },
    );
  }
}
