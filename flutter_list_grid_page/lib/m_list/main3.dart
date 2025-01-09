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
        body: ListView.separated(
            itemBuilder: (context, index) {
              return ListTile(
                leading: Icon(
                  Icons.star,
                  color: Colors.amber,
                  size: 20,
                ),
                // leading: CircleAvatar(
                //   backgroundColor: Colors.lightGreen,
                //   child: Text('${index + 1}'),
                // ),
                title: Text(
                  '안녕 ${index + 1}',
                  style: TextStyle(
                    color: Colors.lightGreen,
                  ),
                ),
                subtitle: Text('머시기저시기 ${index + 1}'),
                trailing: IconButton(
                  onPressed: () {
                    print('방가');
                  },
                  icon: Icon(Icons.add),
                ),
              );
            },
            separatorBuilder: (context, index) {
              return Divider(
                thickness: 0.5,
                color: Colors.grey,
              );
            },
            itemCount: 20),
      ),
    );
  }
}
