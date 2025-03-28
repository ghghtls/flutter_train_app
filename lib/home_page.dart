import 'package:flutter/material.dart';
import 'package:flutter_train_app/station_list_page.dart';

class HomePage extends StatelessWidget {
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('기차예매')),
      body: ColoredBox(
        color: Colors.grey[200]!,
        child: SizedBox.expand(
          // 전체 화면을 채워서 가운데 정렬 가능하게 함
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center, // 세로 가운데 정렬
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),

                ///패딩으로 기차역 컨테이너 박스 줄이기
                child: Container(
                  height: 200,
                  padding: EdgeInsets.all(16), // 내부 여백 추가 (선택)
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20), // 모서리 둥글게
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 30),
                    child: Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisSize: MainAxisSize.min, // 위젯 크기만큼만 정렬
                        children: [
                          // 출발역 섹션
                          Column(
                            children: [
                              Text(
                                '출발역',
                                style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.grey,
                                ),
                              ),
                              SizedBox(height: 8), // 간격
                              GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder:
                                          (context) => StationListPage(
                                            stations: stations,
                                            type: '출발역',

                                            ///타입설정해서 리스트 앱바에 맞게 뿌려주기
                                          ),
                                    ),
                                  );
                                },

                                child: Text(
                                  '선택',
                                  style: TextStyle(fontSize: 40),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(width: 40),
                          Container(
                            margin: EdgeInsets.symmetric(horizontal: 8),
                            width: 2,
                            height: 50,
                            color: Colors.grey[400],
                          ),

                          SizedBox(width: 40),
                          SizedBox(height: 24), // 출발역-도착역 간 간격 추가
                          // 도착역 섹션
                          Column(
                            children: [
                              Text(
                                '도착역',
                                style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.grey,
                                ),
                              ),
                              SizedBox(height: 8), // 간격
                              GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder:
                                          (context) => StationListPage(
                                            stations: stations,
                                            type: '도착역',

                                            ///타입설정해서 리스트 앱바에 맞게 뿌려주기
                                          ),
                                    ),
                                  );
                                },

                                child: Text(
                                  '선택',
                                  style: TextStyle(fontSize: 40),
                                ),
                              ),
                            ],
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
                  onPressed: () {
                    print('클릭');
                  },

                  style: ElevatedButton.styleFrom(
                    fixedSize: Size(325, 50),
                    backgroundColor: Colors.purple,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20), // 둥글게
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
