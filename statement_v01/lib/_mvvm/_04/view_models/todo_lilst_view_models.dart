import 'package:flutter_statement_v01/_mvvm/_04/models/todo_item.dart';

class TodoListViewModel {
  List<TodoItem> _items = [];

  List<TodoItem> get items => _items;

  void addItem(String title) {
    _items.add(TodoItem(title: title));
  }

  void toggleCheck(TodoItem todo) {
    todo.isDone != todo.isDone;
  }
}
