import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dio_ex01/main02.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SafeArea(
        child: Scaffold(
          body: HomePage(),
        ),
      ),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Dio _dio = Dio();

  // 모델링한 타입 추가
  Todo? _todo;

  @override
  void initState() {
    super.initState();
    // 객체 실행시 한번 호출 메서드
    _fetchTodos();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: _todo == null
          ? CircularProgressIndicator()
          : Column(
              children: [
                Text('ID : ${_todo!.id}'),
                Text('userId : ${_todo!.userId}'),
                Text('title : ${_todo!.title}'),
                Text('completed : ${_todo!.completed}'),
              ],
            ),
    );
  }

  // 통신을 담당하는 메서드를 만들어 보자.
  _fetchTodos() async {
    try {
      Response response =
          await _dio.get('https://jsonplaceholder.typicode.com/todos/5');
      //멤버 변수 값을 담는다.
      _todo = Todo.fromJson(response.data);
      setState(() {});
      print('----------------------------------------------------------------');
      // Map 으로 들어온 데이터를 Todo 객체를 생성해서 상태 값을 담아 보시오.
    } catch (e) {
      print('실행 시점 예외가 발생 했어요');
      print(e.toString());
    }
  }
}

// dart
class Todo {
  int? userId;
  int? id;
  String? title;
  bool? completed;

  Todo(
      {required this.userId,
      required this.id,
      required this.title,
      required this.completed});

  // dart 생성자 -> 명명된 생성자
  Todo.fromJson(Map<String, dynamic> json)
      : userId = json['userId'],
        id = json['id'],
        title = json['title'],
        completed = json['completed'];

  @override
  String toString() {
    return 'Todo{userId: $userId, id: $id, title: $title, completed: $completed}';
  }
}

// 리스트 형태로 받아오는 값

// import 'package:dio/dio.dart';
// import 'package:flutter/material.dart';
//
// void main() => runApp(MyApp());
//
// class MyApp extends StatelessWidget {
//   const MyApp({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       home: SafeArea(
//         child: Scaffold(
//           body: HomePage(),
//         ),
//       ),
//     );
//   }
// }

// class HomePage extends StatefulWidget {
//   const HomePage({super.key});
//
//   @override
//   State<HomePage> createState() => _HomePageState();
// }
//
// class _HomePageState extends State<HomePage> {
//   Dio _dio = Dio();
//
//   // List 타입으로 변경
//   List<Todo> _todos = [];
//
//   @override
//   void initState() {
//     super.initState();
//     // 객체 실행시 한번 호출 메서드
//     _fetchTodos();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Center(
//       child: _todos.isEmpty
//           ? CircularProgressIndicator()
//           : ListView.builder(
//         itemCount: _todos.length,
//         itemBuilder: (context, index) {
//           final todo = _todos[index];
//           return ListTile(
//             title: Text(todo.title ?? 'No Title'),
//             subtitle: Text('ID: ${todo.id}, UserID: ${todo.userId}'),
//             trailing: Icon(
//               todo.completed! ? Icons.check_circle : Icons.cancel,
//               color: todo.completed! ? Colors.green : Colors.red,
//             ),
//           );
//         },
//       ),
//     );
//   }
//
//   // 통신을 담당하는 메서드 수정
//   _fetchTodos() async {
//     try {
//       Response response =
//       await _dio.get('https://jsonplaceholder.typicode.com/todos/');
//       // List<Map<String, dynamic>> 형태로 데이터를 받아 처리
//       List<dynamic> data = response.data;
//       _todos = data.map((json) => Todo.fromJson(json)).toList();
//
//       setState(() {}); // 상태 갱신
//       print('데이터 가져오기 성공');
//     } catch (e) {
//       print('실행 시점 예외가 발생했어요');
//       print(e.toString());
//     }
//   }
// }
//
// // 모델 클래스 (기존 코드 유지)
// class Todo {
//   int? userId;
//   int? id;
//   String? title;
//   bool? completed;
//
//   Todo(
//       {required this.userId,
//         required this.id,
//         required this.title,
//         required this.completed});
//
//   // JSON 데이터를 객체로 변환하는 생성자
//   Todo.fromJson(Map<String, dynamic> json)
//       : userId = json['userId'],
//         id = json['id'],
//         title = json['title'],
//         completed = json['completed'];
//
//   @override
//   String toString() {
//     return 'Todo{userId: $userId, id: $id, title: $title, completed: $completed}';
//   }
// }
