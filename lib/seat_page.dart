import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_train_app/home_page.dart';

class SeatPage extends StatefulWidget {
  SeatPage(
    this.selectedRow,
    this.selectedCol,
    this.selectedDeparture,
    this.selectedArrive,
    this.onSelected,
  );

  final int? selectedRow;
  final int? selectedCol;
  final String selectedDeparture;
  final String selectedArrive;
  final void Function(int row, int col) onSelected;

  @override
  State<SeatPage> createState() => _SeatPageState();
}

class _SeatPageState extends State<SeatPage> {
  int? _selectedRow;
  int? _selectedCol;

  final int totalRows = 20;
  // 전체 좌석 행수
  final int seatsPerRow = 4;

  ///열은 총 4개

  final List<String> ColumnLabels = ['A', 'B', 'C', 'D'];

  ///각 행에 좌석 수

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('좌석선택'),
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context); // 뒤로가기
          },
        ),
      ),

      body: SingleChildScrollView(
        ///expanded에서 SingleChildScrollView로 변경
        child: Padding(
          padding: const EdgeInsets.all(16.0),

          /// 전체 여백 주기
          child: Column(
            children: [
              Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      widget.selectedDeparture,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.purple,
                        fontSize: 30,
                      ),
                    ),
                    SizedBox(width: 30),
                    Icon(Icons.arrow_circle_right_outlined, size: 30),
                    SizedBox(width: 30),
                    Text(
                      widget.selectedArrive,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.purple,
                        fontSize: 30,
                      ),
                    ),
                  ],
                ),
              ),

              SizedBox(height: 16),

              ///텍스트와 범례 사이 간격

              /// 범례를 한 줄 Row로 구성 (중첩 구조 제거)
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 24,
                    height: 24,
                    decoration: BoxDecoration(
                      color: Colors.purple,
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  SizedBox(width: 4),
                  Text('선택됨', style: TextStyle(fontSize: 18)),

                  SizedBox(width: 20),

                  Container(
                    width: 24,
                    height: 24,
                    decoration: BoxDecoration(
                      color: Colors.grey[300]!,
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  SizedBox(width: 4),
                  Text('선택안됨', style: TextStyle(fontSize: 18)),
                ],
              ),

              SizedBox(height: 30),

              ///텍스트와 좌석 간격

              ///열 라벨 표시 (A,B [통로] C,D)
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _buildColumnLabel('A'),
                  _buildColumnLabel('B'),
                  SizedBox(width: 68),
                  _buildColumnLabel('C'),
                  _buildColumnLabel('D'),
                ],
              ),

              ///좌석 생성 부분
              Column(
                children: List.generate(totalRows, (rowIndex) {
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 8.0),

                    ///세로 간격 8
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        /// 왼쪽 좌석 A,B
                        Seat(rowIndex, 0),
                        SizedBox(width: 4),

                        ///가로간격 4

                        ///좌석 사이 간격
                        Seat(rowIndex, 1),

                        ///가운데 통로 + 행번호
                        SizedBox(width: 30),

                        SizedBox(
                          width: 30,
                          child: Center(
                            child: Text(
                              '${rowIndex + 1}',

                              ///중앙에 행 번호 출력
                              style: TextStyle(fontSize: 18),
                            ),
                          ),
                        ),
                        SizedBox(width: 30),

                        ///오른쪽 좌석 C,D
                        Seat(rowIndex, 2),
                        SizedBox(width: 4),
                        Seat(rowIndex, 3),
                      ],
                    ),
                  );
                }),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.purple,
            padding: EdgeInsets.symmetric(vertical: 16),
          ),
          onPressed: () {
            if (_selectedRow == null || _selectedCol == null) {
              ScaffoldMessenger.of(
                context,
              ).showSnackBar(SnackBar(content: Text('좌석을 먼저 선택해주세요')));
              return;
            }

            String colLabel = ColumnLabels[_selectedCol!];
            int rowLabel = _selectedRow! + 1;

            showCupertinoDialog(
              context: context,
              builder: (context) {
                return CupertinoAlertDialog(
                  title: Text('예매 하시겠습니까?'),
                  content: Text('좌석: $rowLabel-$colLabel'),
                  actions: [
                    CupertinoDialogAction(
                      isDefaultAction: true,
                      onPressed: () => Navigator.of(context).pop(),
                      child: Text('취소', style: TextStyle(color: Colors.red)),
                    ),
                    CupertinoDialogAction(
                      onPressed: () {
                        Navigator.of(context).pop(); // 다이얼로그 닫기

                        Navigator.of(context).pushReplacement(
                          MaterialPageRoute(
                            builder: (context) => HomePage(),

                            ///확인버튼 누르면
                          ), //
                        );
                      },
                      child: Text('확인', style: TextStyle(color: Colors.blue)),
                    ),
                  ],
                );
              },
            );
          },
          child: Text(
            '예매하기',
            style: TextStyle(
              fontSize: 18,
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }

  ///열라벨 위젯 (A~D)
  Widget _buildColumnLabel(String label) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Container(
        width: 50,
        alignment: Alignment.center,
        child: Text(
          label,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 18,
            color: Colors.black,
          ),
        ),
      ),
    );
  }

  Widget Seat(int rowNum, int colNum) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedRow = rowNum;
          _selectedCol = colNum;
        });
        widget.onSelected(rowNum, colNum);
      },

      ///클릭 시 이벤트 호출
      child: Container(
        width: 50,

        ///고정된크기 이므로 expanded 제거
        height: 50,
        decoration: BoxDecoration(
          color:
              rowNum == _selectedRow && colNum == _selectedCol
                  ? Colors.purple
                  : Colors.grey[300]!,
          borderRadius: BorderRadius.circular(20),

          ///모서리 둥글게
        ),
      ),
    );
  }
}
