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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
              flex: 1, child: Center(child: Text(displayText))), // 1:1:1 비율
          Expanded(flex: 1, child: Child1()),
          Expanded(flex: 1, child: Child2()),
        ],
      ),
    );
  }
}

// 자식 a
class Child1 extends StatelessWidget {
  const Child1({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(30.0),
      child: InkWell(
        onTap: () {
          print('child1에 이벤트 발생');
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
  const Child2({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(30.0),
      child: InkWell(
        onTap: () {
          print('child2에 이벤트 발생');
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
