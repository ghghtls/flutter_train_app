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

      body: Column(
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
        ],
      ),
    );
  }
}
