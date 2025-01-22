// Model
class TodoItem {
  String title;
  bool isDone;

  // 여기에도 메서드를 만들 수는 있음. 보통 해당 TodoItem 데이터랑만 연관된 메서드를 만들어 주는 것이 좋음.
  // 화면과 연관되는 메서드 같은 경우에는 view_models에 만드는 것이 좋음.
  //기본값을 넣으려면 required를 빼야함
  TodoItem({required this.title, this.isDone = false});
}
