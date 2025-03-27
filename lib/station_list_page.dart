import 'package:flutter/material.dart';

class StationListPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final listpage = ModalRoute.of(context)?.settings.arguments as String?;

    ///받는 코드!
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context); // 뒤로가기
          },
        ),
        title: Text('출발역'),
      ),
      body: Center(child: Text(listpage ?? '데이터 없음')),
    );
  }
}
