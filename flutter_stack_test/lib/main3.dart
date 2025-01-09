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
          body: Center(
            child: Stack(
              alignment: Alignment.center,
              children: [
                Container(
                  width: 200,
                  height: 200,
                  color: Colors.red,
                ),
                Container(
                  width: 150,
                  height: 150,
                  color: Colors.green,
                ),
                Container(
                  width: 100,
                  height: 100,
                  color: Colors.yellow,
                ),
                Container(
                  width: 50,
                  height: 50,
                  color: Colors.purple,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
