import 'package:flutter/material.dart';

class SeatPage extends StatelessWidget {
  SeatPage(this.selectedRow, this.selectedCol, this.onSelected);

  final int? selectedRow;
  final int? selectedCol;
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
      body: ColoredBox(
        color: Colors.grey[200]!,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center, //세로 가운데 정렬
          children: [
            // 위젯들
          ],
        ),
      ),
    );
  }
}
