// viewModel

import 'package:flutter_statement_v01/_mvvm/_03/models/todo_item.dart';
import 'package:flutter_statement_v01/riverpod_v01/_01/todo.dart';

class TodoListViewModel {
  List<TodoItem> _items = [];
  // get
  List<TodoItem> get items => _items;

  // 데이터 변경과 관련된 로직
  // 비즈니스 로직 (title을 받았음)Todo객체로 받아도되고...
  void addItem(String title) {
    _items.add(TodoItem(title: title));
  }

  void toggleItem(TodoItem todo) {
    todo.isDone = !todo.isDone;
  }
}
