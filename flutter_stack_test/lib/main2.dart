import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SafeArea(
        child: Scaffold(
          body: Stack(
            // alignment: Alignment.bottomRight,
            // Stack 위젯안에 Positioned 위젯을 사용할 수 있다.
            children: [
              Positioned(
                top: 50,
                left: 50,
                child: Container(
                  width: 100,
                  height: 100,
                  color: Colors.red,
                ),
              ),
              Positioned(
                // 부모기준으로 바텀에서 50
                bottom: 50,
                right: 50,
                child: Container(
                  width: 50,
                  height: 50,
                  color: Colors.green,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
