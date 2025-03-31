import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_train_app/seat_page.dart';
import 'package:flutter_train_app/station_list_page.dart';
import 'package:flutter_train_app/home_page.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int? selectedRow;
  int? selectedCol;
  String selectedDeparture = ''; //
  String selectedArrive = '';
  void onSelected(int row, int col) {
    setState(() {
      selectedRow = row;
      selectedCol = col;
    });
  }

  final List<String> stations = [
    '수서',
    '동탄',
    '평택지제',
    '천안아산',
    '오송',
    '대전',
    '김천구미',
    '동대구',
    '경주',
    '울산',
    '부산',
  ];
  bool isbutton = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('기차예매'), centerTitle: true),
      body: ColoredBox(
        color:
            Theme.of(context).brightness == Brightness.dark
                ? Colors.black
                : Colors.grey[200]!,
        child: SizedBox.expand(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Container(
                  height: 200,

                  ///출발역,도착역 감싸고 있는 박스
                  padding: EdgeInsets.all(30),
                  decoration: BoxDecoration(
                    color:
                        Theme.of(context).brightness == Brightness.dark
                            ? Colors.grey
                            : Colors.white,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 30),
                    child: Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Expanded(
                            child: Column(
                              children: [
                                Text(
                                  '출발역',
                                  style: TextStyle(
                                    fontSize: 16,
                                    color:
                                        Theme.of(context).brightness ==
                                                Brightness.dark
                                            ? Colors.white
                                            : Colors.grey,
                                  ),
                                ),
                                SizedBox(height: 8),
                                GestureDetector(
                                  onTap: () async {
                                    /// 도착역을 제외한 도착역 리스트 만들기
                                    final filteredStations1 =
                                        stations
                                            .where(
                                              (station) =>
                                                  station != selectedArrive,

                                              ///도착역 제외된 리스트 전달
                                            )
                                            .toList();
                                    final result = await Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder:
                                            (context) => StationListPage(
                                              stations: filteredStations1,
                                              type: '출발역',
                                            ),
                                      ),
                                    );
                                    if (result != null) {
                                      if (result == selectedDeparture) {
                                        // 출발역과 같은 역 선택 시 경고 다이얼로그
                                        showDialog(
                                          context: context,
                                          builder:
                                              (context) => AlertDialog(
                                                title: Text('잘못된 선택'),
                                                content: Text(
                                                  '중복입니다. 다시 선택해주세요',
                                                ),
                                                actions: [
                                                  TextButton(
                                                    onPressed:
                                                        () =>
                                                            Navigator.of(
                                                              context,
                                                            ).pop(),
                                                    child: Text('확인'),
                                                  ),
                                                ],
                                              ),
                                        );
                                        return;
                                      }
                                      setState(() {
                                        selectedDeparture = result;
                                      });
                                    }
                                  },
                                  child: Text(
                                    selectedDeparture.isEmpty
                                        ? '선택'
                                        : selectedDeparture,
                                    style: TextStyle(fontSize: 30),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(width: 20),
                          Container(
                            margin: EdgeInsets.symmetric(horizontal: 8),
                            width: 2,
                            height: 50,
                            color: Colors.grey[400],
                          ),
                          SizedBox(width: 20),
                          Expanded(
                            child: Column(
                              children: [
                                Text(
                                  '도착역',
                                  style: TextStyle(
                                    fontSize: 16,
                                    color:
                                        Theme.of(context).brightness ==
                                                Brightness.dark
                                            ? Colors.white
                                            : Colors.grey,
                                  ),
                                ),
                                SizedBox(height: 8),
                                GestureDetector(
                                  onTap: () async {
                                    /// 출발역을 제외한 도착역 리스트 만들기
                                    final filteredStations2 =
                                        stations
                                            .where(
                                              (station) =>
                                                  station != selectedDeparture,
                                            )
                                            .toList();

                                    final result = await Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder:
                                            (context) => StationListPage(
                                              stations: filteredStations2,

                                              ///출발역 제외된 리스트 전달
                                              type: '도착역',
                                            ),
                                      ),
                                    );
                                    if (result != null) {
                                      if (result == selectedArrive) {
                                        // 도착역과 같은 역 선택 시 경고 다이얼로그
                                        showDialog(
                                          context: context,
                                          builder:
                                              (context) => AlertDialog(
                                                title: Text('잘못된 선택'),
                                                content: Text(
                                                  '중복입니다. 다시 선택해주세요',
                                                ),
                                                actions: [
                                                  TextButton(
                                                    onPressed:
                                                        () =>
                                                            Navigator.of(
                                                              context,
                                                            ).pop(),
                                                    child: Text('확인'),
                                                  ),
                                                ],
                                              ),
                                        );
                                        return;
                                      }
                                      setState(() {
                                        selectedArrive = result;
                                      });
                                    }
                                  },
                                  child: Text(
                                    selectedArrive!.isEmpty
                                        ? '선택'
                                        : selectedArrive!,

                                    style: TextStyle(fontSize: 30),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 20),
                child: ElevatedButton(
                  onPressed: () async {
                    /// 출발역 또는 도착역이 선택되지 않았을 경우
                    if (selectedDeparture == null ||
                        selectedDeparture.isEmpty ||
                        selectedArrive == null ||
                        selectedArrive.isEmpty) {
                      ScaffoldMessenger.of(
                        context,
                      ).showSnackBar(SnackBar(content: Text('기차역을 선택해주세요')));
                      return;

                      ///여기서 함수 종료 >다음페이지로 안넘어감
                    }
                    final result = await Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder:
                            (context) => SeatPage(
                              selectedRow,
                              selectedCol,
                              selectedDeparture,
                              selectedArrive,
                              onSelected,
                            ),
                      ),
                    );
                  },

                  style: ElevatedButton.styleFrom(
                    fixedSize: Size(325, 50),
                    backgroundColor: Colors.purple,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  child: Text(
                    '좌석선택',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
