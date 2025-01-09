import 'package:flutter/material.dart';
import 'package:flutter_stack_test/main.dart';

//람다식 동일코드
void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Center(
          child: Stack(
            children: [
              // 배경을 꾸며 보자
              Container(
                width: 300,
                height: 300,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage(
                            'assets/KakaoTalk_20250108_115109220.jpg'),
                        fit: BoxFit.cover),
                    borderRadius: BorderRadius.circular(15)),
              ),
              //반투명 레이어
              Container(
                width: 300,
                height: 300,
                decoration: BoxDecoration(
                  color: Colors.black.withOpacity(0.3),
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
              Positioned(
                top: 30,
                left: 10,
                child: Text(
                  '내 이름은 정마요',
                  style: TextStyle(fontSize: 24, color: Colors.white),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
