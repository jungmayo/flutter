// Model
class TodoItem {
  String title;
  bool isDone;

  //기본값을 넣으려면 required를 빼야함
  TodoItem({required this.title, this.isDone = false});
}

