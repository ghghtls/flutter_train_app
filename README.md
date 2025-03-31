### README 

<h1 align="center">
기차 예매 서비스
</h1>
<p align="center">
</p>

## 프로젝트 개요
기차 예매 서비스

### 프로젝트 일정
25/03/26~25/03/31



## 주요 기능

- [x] 출발역,도착역 선택영역 터치 시 StationListPage로 이동,StationListPage 에서 역 선택 시 선택한 역으로 문자열 변경,선택한 역이 없는 초기 상태에는 ‘선택’ 문구 출력.

- [x] 좌석 선택 버튼 터치 시 SeatPage 로 이동,출발역, 도착역 모두 선택되어 있지 않을 경우 이동하지 않음.

- [x] HomePage에서 출발역 클릭하여 이 페이지로 진입 시 출발역, 도착역 클릭하여 이 페이지로 진입 시 도착역 출력

- [x] 아무런 값을 돌려주지 않고 뒤로가기,뒤로가기 버튼을 통해 뒤로갈 경우 HomePage 의 출발역, 도착역은 변경되지 않음

- [x] 각 기차역 이름을 터치 시 해당 역 이름을 반환하며 뒤로가기.

- [x] HomePage 에서 선택한 출발역을 전달받아 출력. HomePage 에서 선택한 도착역을 전달받아 출력.

- [x] 선택되었을때와 미선택시의 색상 안내.

- [x] 초기 상태는 모두 회색. 좌석 터치 시 색상 보라색으로 변경

- [x] 선택된 좌석이 없으면 아무런 반응 X. 선택된 좌석이 있으면 터치 시 아래의 showCupertinoDialog 출력

- [x] 출발/도착역을 선택할 때, 이미 선택된 역은 선택 목록에서 제외

- [x] 다크테마 기능

- [x] 좌석페이지에서 좌석 선택 안하고 예매하기 버튼 눌렀을 시 메시지 나오게 하기

- [x] 출발역과 같은 역 선택시 경고 다이얼로그 중복 방지 메세지




<br/>

## TroubleShooting


### 문제-데코레이션으로 버튼 둥글게 처리하려고 했는데 오류가 나는 문제 
decoration: BoxDecoration(...) → ❌ Container 전용

### 해결-아래 코드로 해결
ElevatedButton은 style.shape:에서 모서리 둥글게 처리해야 함 👉 RoundedRectangleBorder

### 문제- 페이지 넘겨서 받는 페이지에서 코드오류 
```dart
body: Center(child: Text((listpage ?? stations).toString())),

```

### 해결-리스트뷰로 화면 뿌려주기 해결
```dart
final listpage =
        ModalRoute.of(context)?.settings.arguments as List<String>?;

    final stationList = listpage ?? stations;
    
    ListView.builder(
        itemCount: stationList.length,
        itemBuilder: (context, index) {
          return ListTile(title: Text(stationList[index]));
        },
      ),
```

### 문제-출발역 ,도착역 눌렀을때 각각 리스트 앱바에 출발역,도착역 안나오는 오류


### 해결- 코드 수정 타입으로 설정해주기, 받는쪽에 타입 설정하기
```dart
 MaterialPageRoute(
                                      builder:
                                          (context) => StationListPage(
                                            stations: stations,
                                            type: '출발역',///타입설정해서 리스트 앱바에 맞게 뿌려주기
```

```dart
final String type;,StationListPage({required this.stations, required this.type});
```

### 문제 - 좌석선택 페이지에서 홈페이지에서 받은 값들 가로로 보여주기가 안됨


### 해결- row로 변경해서 가로로 정렬

```
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
```

### 문제- seatPage에서 홈페이지 선택한 기차역 부분 가운데 정렬 안된부분


### 해결 - expanded()로 해결 


### 문제-출발역 또는 도착역이 선택되지 않았을 경우 다음페이지로 안넘어가는 코드
중 오류 발생 다음페이지로 넘어감 
```dart
 // 출발역 또는 도착역이 선택되지 않았을 경우
    if (selectedDeparture == null || selectedArrive == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('기차역을 선택해주세요')),
      );
      return; // 여기서 함수 종료 → 다음 페이지로 안 넘어감
    }
```

### 해결 - 문자열 ''이부분도 체크를 해줘야한다. 그래서 isEmpty도 해줘야한다.
```dart
if (selectedDeparture == null || selectedDeparture.isEmpty ||
    selectedArrive == null || selectedArrive.isEmpty) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(content: Text('기차역을 선택해주세요')),
  );
  return;
}

```