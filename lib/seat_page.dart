import 'package:flutter/material.dart';

class SeatPage extends StatelessWidget {
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

  final int totalRows = 20; // 전체 좌석 행수
  final int seatsPerRow = 4;

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
                      selectedDeparture,
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
                      selectedArrive,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.purple,
                        fontSize: 30,
                      ),
                    ), // 위젯들
                  ],
                ),
              ),

              SizedBox(height: 30),

              ///텍스트와 좌석 간격

              ///좌석 생성 부분
              Column(
                children: List.generate(totalRows, (rowIndex) {
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 8.0),

                    ///세로 간격 8
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(seatsPerRow, (colIndex) {
                        return Padding(
                          padding: const EdgeInsets.only(right: 4.0),

                          ///가로 간격 4
                          child: Seat(rowIndex, colIndex),
                        );
                      }),
                    ),
                  );
                }),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget Seat(int rowNum, int colNum) {
    return GestureDetector(
      onTap: () => onSelected(rowNum, colNum),

      ///클릭 시 이벤트 호출
      child: Container(
        width: 50,

        ///고정된크기 이므로 expanded 제거
        height: 50,
        decoration: BoxDecoration(
          color:
              rowNum == selectedRow && colNum == selectedCol
                  ? Colors.purple
                  : Colors.grey[300]!,
          borderRadius: BorderRadius.circular(20),

          ///모서리 둥글게
        ),
      ),
    );
  }
}
