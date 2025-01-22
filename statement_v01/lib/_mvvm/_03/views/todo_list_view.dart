import 'package:flutter/material.dart';
import 'package:flutter_statement_v01/_mvvm/_03/models/todo_item.dart';
import 'package:flutter_statement_v01/_mvvm/_03/view_models/todo_list_view_model.dart';

class TodoListView extends StatefulWidget {
  const TodoListView({super.key});

  @override
  State<TodoListView> createState() => _TodoListViewState();
}

class _TodoListViewState extends State<TodoListView> {
  // 뷰는 뷰 모델만 바라보면 된다.
  TodoListViewModel _listViewModel = TodoListViewModel();

  TextEditingController _controller = TextEditingController();

  // 샘플 데이터
  // List<TodoItem> _todoItems = [
  //   TodoItem(title: '플러터 공부'),
  //   TodoItem(title: '낮잠 자기', isDone: true),
  // ];

  @override
  Widget build(BuildContext context) {
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
                  _listViewModel.addItem(_controller.text);
                  setState(() {});
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
            itemCount: _listViewModel.items.length,
            itemBuilder: (context, index) {
              final TodoItem item = _listViewModel.items[index];
              return ListTile(
                title: Text(item.title),
                trailing: Checkbox(
                  value: item.isDone,
                  onChanged: (value) {
                    _listViewModel.toggleItem(item);
                    setState(() {});
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
