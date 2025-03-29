import 'package:flutter/material.dart';

class StationListPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
<<<<<<< Updated upstream
    return Text('StationListPage');
=======
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context, stations); // 뒤로가기
          },
        ),
        title: Text(type),

        ///홈페이지에 설정한 값 설정
      ),
      body: ListView.builder(
        itemCount: stations.length,
        itemBuilder: (context, index) {
          return Column(
            children: [
              ListTile(
                title: Container(
                  height: 50,
                  alignment: Alignment.centerLeft, // 가로는 왼쪽, 수직은 가운데

                  child: Text(
                    stations[index],

                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ),
                onTap: () {
                  Navigator.pop(context, stations[index]);
                },
              ),
              Container(height: 1, color: Colors.grey[300]!),
            ],
          );
        },
      ),
    );
>>>>>>> Stashed changes
  }
}
