import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ParentsView(),
    );
  }
}

// 부모 클래스
class ParentsView extends StatefulWidget {
  const ParentsView({super.key});

  @override
  State<ParentsView> createState() => _ParentsViewState();
}

class _ParentsViewState extends State<ParentsView> {
  String displayText = '여기는 부모 위젯 변수야';

  // 메서드를 선언해 보자
  void handleChildEvent() {
    // build() 메서드 호출
    setState(() {
      displayText = '야 어딘지는 모르겠지만 자식위젯에서 이벤트 발생';
    });
  }

  void handchild2Event() {
    setState(() {
      displayText = '에에에에';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
              flex: 1, child: Center(child: Text(displayText))), // 1:1:1 비율
          Expanded(
              flex: 1,
              child: Child1(
                onCallbackReceived: handleChildEvent,
              )), // 자식이 태어난 시점에서 생성자에게 진동벨을 받을 수 있도록 콜백함수를 설정해야 됨.
          Expanded(
              flex: 1,
              child: Child2(
                onCallbackReceived2: handchild2Event,
              )),
        ],
      ),
    );
  }
}

// 자식 a
class Child1 extends StatelessWidget {
  const Child1({required this.onCallbackReceived, super.key}); // 생성자

  final Function
      onCallbackReceived; // final 반드시 한번 초기화 되어야 한다. 그래서 위에 required를 붙임

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(30.0),
      child: InkWell(
        onTap: () {
          print('child1에 이벤트 발생');
          onCallbackReceived(); // ()를 쓰면 호출, 그냥 ;이면 function이라는 데이터타입 자체를 말함
        },
        child: Container(
          width: double.infinity, //부모 위젯 크기안에서 최대한 무한대로 확장하라는 의미
          color: Colors.orange,
          child: Center(child: Text('Child 1')),
        ),
      ),
    );
  }
}

// 자식 b
class Child2 extends StatelessWidget {
  const Child2(
      {required this.onCallbackReceived2,
      super.key}); // required 외부에서 값을 반드시 제공해야 됨

  final Function
      onCallbackReceived2; // 생성자를 통해서 부모에게서 전달받을 수 있음, 부모에게 메서드를 받기위해 저장하기 위한 변수를 설정

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(30.0),
      child: InkWell(
        onTap: () {
          print('child2에 이벤트 발생');
          onCallbackReceived2(); // 누르면 부모에게 진동벨 전달
        },
        child: Container(
          width: double.infinity, //부모 위젯 크기안에서 최대한 무한대로 확장하라는 의미
          color: Colors.red,
          child: Center(child: Text('Child 2')),
        ),
      ),
    );
  }
}
