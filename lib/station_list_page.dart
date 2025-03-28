import 'package:flutter/material.dart';

class StationListPage extends StatelessWidget {
  final List<String> stations;
  final String type;
  // '수서',
  // '동탄',
  // '평택지제',
  // '천안아산',
  // '오송',
  // '대전',
  // '김천구미',
  // '동대구',
  // '경주',
  // '울산',
  // '부산',
  StationListPage({required this.stations, required this.type});
  @override
  Widget build(BuildContext context) {
    final listpage =
        ModalRoute.of(context)?.settings.arguments as List<String>?;

    final stationList = listpage ?? stations;

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context); // 뒤로가기
          },
        ),
        title: Text(type),
      ),
      body: ListView.builder(
        itemCount: stationList.length,
        itemBuilder: (context, index) {
          return ListTile(title: Text(stationList[index]));
        },
      ),
    );
  }
}
