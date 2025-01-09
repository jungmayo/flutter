import 'package:flutter/material.dart';
import 'package:flutter_list_grid_page/main.dart';

// ListView 와 ListTitle 위젯을 살펴 보자
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
        //위젯을 반환해야하는 함수(매개변수 2개)가 타입임
        body: ListView.builder(
          itemCount: 40,
          itemBuilder: (context, index) {
            return ListTile(
              leading: CircleAvatar(
                backgroundColor: Colors.amber,
                child: Text('${index + 1}'),
              ),
              title: Text('Item ${index + 1}'),
              subtitle: Text('Item_sub ${index + 1}'),
              trailing: IconButton(
                onPressed: () {
                  print('안녕');
                },
                icon: Icon(Icons.add),
              ),
            );
          },
        ),
      ),
    );
  }
}
