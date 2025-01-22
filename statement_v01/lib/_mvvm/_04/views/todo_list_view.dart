import 'package:flutter/material.dart';
import 'package:flutter_statement_v01/_mvvm/_04/models/todo_item.dart';
import 'package:flutter_statement_v01/_mvvm/_04/view_models/todo_lilst_view_models.dart';

class TodoListView extends StatefulWidget {
  const TodoListView({super.key});

  @override
  State<TodoListView> createState() => _TodoListViewState();
}

class _TodoListViewState extends State<TodoListView> {
  TodoListViewModel _listViewModel = TodoListViewModel();

  TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextField(
          decoration: InputDecoration(
            hintText: '할 일을 입력하세요',
            suffixIcon: IconButton(
              onPressed: () {
                _listViewModel.addItem(_controller.text);
                setState(() {});
                _controller.clear();
              },
              icon: Icon(Icons.add),
            ),
          ),
        ),
        SizedBox(height: 16.0),
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
                    _listViewModel.toggleCheck(item);
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
