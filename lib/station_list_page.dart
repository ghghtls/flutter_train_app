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
  ///final 값을 한번만 설정하고 변경하지 못하게,생성자에서 한번만 설정 가능하고 이후에는 값 변경 안됨 , 읽기전용 빌드
  ///required 생성할때 반드시 값을 넣어야 한다는 뜻  둘다 같이 쓰면 한번만 지정되고,절대 변경 되지않음 안정성+명확성 모두 확보

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

        ///홈페이지에 설정한 값 설정
      ),
      body: ListView.builder(
        itemCount: stationList.length,
        itemBuilder: (context, index) {
          return Column(
            children: [
              ListTile(
                title: Container(
                  height: 50,
                  alignment: Alignment.centerLeft, // 가로는 왼쪽, 수직은 가운데

                  child: Text(
                    stationList[index],

                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ),
                onTap: () {
                  Navigator.pop(context, stationList[index]);
                },
              ),
              Container(height: 1, color: Colors.grey[300]!),
            ],
          );
        },
      ),
    );
  }
}
