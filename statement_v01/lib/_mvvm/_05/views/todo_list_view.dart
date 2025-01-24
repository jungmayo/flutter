import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_statement_v01/_mvvm/_05/models/todo_item.dart';
import 'package:flutter_statement_v01/_mvvm/_05/view_models/todo_list_view_model.dart';

// 화면에서 TodoListView 띄울때 const를 못띄우는것 뿐.. const 삭제
class TodoListView extends ConsumerWidget {
  // 상태관리를 쓴다는 것 --> 동기화의 목적이있다. (공유되는 데이터를 여러 화면에서 동일하게 나타내기 위해서)
  // 의존성 관리 <-- 강한 소유의 관계를 끊어버리기 위해서

  TextEditingController _controller = TextEditingController();

  TodoListView({super.key});

// 상태를 감지하면 build가 다시 호출 되어야함
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // todoItem 객체는 상태가 있다. --> 즉, 변수가 변화할 가능성이 있다.
    // todos --> List<TodoItem>이 된다. <-- 계속 감시 중
    final todos = ref.watch(todoListViewModelProvider); // 상태값 꺼내오는 것
    // todoNotifier --> 뷰 모델
    final todoNotifier = ref.watch(
        todoListViewModelProvider.notifier); // 창고에 직접 접근 가능(그 안의 메서드를 쓰기 위해서)

    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: TextField(
            controller: _controller, //(입력한글자)여기에 접근해서 온 프레스드에서사용할 수 있음
            decoration: InputDecoration(
              hintText: 'Enter todo item...',
              suffixIcon: IconButton(
                onPressed: () {
                  // 추가 로직 넣을 예정
                  //_listViewModel.addItem(_controller.text);
                  // setState(() {});
                  todoNotifier.addItem(_controller.text);
                  _controller.clear(); // 입력후 플러스버튼하면 사라짐
                },
                icon: Icon(Icons.add),
              ),
            ),
          ),
        ),
        SizedBox(height: 16.0),
        // 위젯을 리턴함
        Expanded(
          child: ListView.builder(
            itemCount: todos.length,
            itemBuilder: (context, index) {
              final TodoItem item = todos[index];
              return ListTile(
                title: Text(item.title),
                trailing: Checkbox(
                  value: item.isDone,
                  onChanged: (value) {
                    todoNotifier.toggleItem(item);
                    // setState(() {});
                  },
                ),
              );
            },
          ),
        )
      ],
    );
  }
}

//////////////////////////////////////////////////////////
//
// // view
// class TodoListView extends StatefulWidget {
//   const TodoListView({super.key});
//
//   @override
//   State<TodoListView> createState() => _TodoListViewState();
// }
//
// class _TodoListViewState extends State<TodoListView> {
//   // 뷰는 뷰 모델만 바라보면 된다.
//   // TodoListViewModel _listViewModel = TodoListViewModel();
//
//   TextEditingController _controller = TextEditingController();
//
//   // 샘플 데이터
//   // List<TodoItem> _todoItems = [
//   //   TodoItem(title: '플러터 공부'),
//   //   TodoItem(title: '낮잠 자기', isDone: true),
//   // ];
//
//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         Padding(
//           padding: const EdgeInsets.all(16.0),
//           child: TextField(
//             controller: _controller, //(입력한글자)여기에 접근해서 온 프레스드에서사용할 수 있음
//             decoration: InputDecoration(
//               hintText: 'Enter todo item...',
//               suffixIcon: IconButton(
//                 onPressed: () {
//                   // 추가 로직 넣을 예정
//                   //_listViewModel.addItem(_controller.text);
//                   setState(() {});
//                   _controller.clear(); // 입력후 플러스버튼하면 사라짐
//                 },
//                 icon: Icon(Icons.add),
//               ),
//             ),
//           ),
//         ),
//         SizedBox(height: 16.0),
//         // 위젯을 리턴함
//         Expanded(
//           child: ListView.builder(
//             itemCount: _listViewModel.items.length,
//             itemBuilder: (context, index) {
//               final TodoItem item = _listViewModel.items[index];
//               return ListTile(
//                 title: Text(item.title),
//                 trailing: Checkbox(
//                   value: item.isDone,
//                   onChanged: (value) {
//                     _listViewModel.toggleItem(item);
//                     setState(() {});
//                   },
//                 ),
//               );
//             },
//           ),
//         )
//       ],
//     );
//   }
// }
