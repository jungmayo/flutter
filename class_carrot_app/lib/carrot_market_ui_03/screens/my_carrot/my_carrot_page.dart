import 'package:flutter/material.dart';

class MyCarrotPage extends StatelessWidget {
  const MyCarrotPage({super.key});

  @override
  Widget build(BuildContext context) {
    print('MyCarrotPage() 메모리 호출 확인');
    return Center(
      child: Text('MyCarrotPage'),
    );
  }
}
