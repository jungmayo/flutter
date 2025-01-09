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
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: GridView.builder(
            // 스크롤의 방향을 지정
            scrollDirection: Axis.vertical,
            // 그리드의 열 개수를 고정하는 속성
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              crossAxisSpacing: 16.0,
              mainAxisSpacing: 25.0,
            ),
            itemCount: 10,
            itemBuilder: (context, index) {
              return GridTile(
                child: Container(
                  height: 130,
                  width: 130,
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.grey,
                      width: 1.0,
                    ),
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  child: Center(
                    child: Icon(
                      Icons.ac_unit,
                      size: 50.0,
                      color: Colors.blue,
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
