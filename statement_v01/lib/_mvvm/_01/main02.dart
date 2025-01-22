import 'package:flutter/material.dart';

void main() {
  runApp(MyApp02());
}

class MyApp02 extends StatelessWidget {
  const MyApp02({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeView(),
    );
  }
}

// ViewModel (카운터를 관리하는?)
class HomeViewModel {
  int _counter = 0;
  int get counter => _counter; // getter

  // 데이터를 변경하는 기능도 뷰 모델이 가진다.
  void incrementCounter() {
    _counter++;
  }
}

// View

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  // // 이 예제에서는 _counter를 모델로 바라볼 수 있다.
  // int _counter = 0; --> 얘를 뜯고 뷰 모델로 만들어 버리기.
  // 뷰는 뷰 모델만 바라보면 된다.
  // 컴퍼지션 관계 - 내부에서 객체를 생성 --> 강한 소유의 관계이다.
  final HomeViewModel homeViewModel = HomeViewModel();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('뷰 모델이 없는 코드를 작성중'),
      ),
      body: Column(
        children: [
          Text(
            '${homeViewModel.counter}',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 20),
          ElevatedButton(
              onPressed: () {
                // 프레젠테이션 로직 ( 화면과 관련된 로직 )
                setState(() {
                  // 비즈니스 로직 // setstate안에있어도 되고 위에 있어도 됨.
                  homeViewModel.incrementCounter();
                });
              },
              child: Text('increment'))
        ],
      ),
    );
  }
}
