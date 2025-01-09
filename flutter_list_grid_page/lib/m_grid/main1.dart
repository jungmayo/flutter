import 'package:flutter/material.dart';
import 'package:flutter_list_grid_page/m_list/main1.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: GridView.builder(
          // 스크롤의 방향을 지정
          scrollDirection: Axis.vertical,
          // 그리드의 열 개수를 고정하는 속성
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            crossAxisSpacing: 16.0,
            mainAxisSpacing: 16.0,
          ),
          itemCount: 10,
          itemBuilder: (context, index) {
            return Container(
              color: Colors.blue,
              child: Center(child: Text('${index + 1}')),
            );
          },
        ),
      ),
    );
  }
}
