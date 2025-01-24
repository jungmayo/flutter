// Model
// 1. 우리가 관리 하고 싶은 데이터 (창고 안에 넣을 상품)
class TodoItem {
  String title;
  bool isDone;

  // 여기에도 메서드를 만들 수는 있음. 보통 해당 TodoItem 데이터랑만 연관된 메서드를 만들어 주는 것이 좋음.
  // 화면과 연관되는 메서드 같은 경우에는 view_models에 만드는 것이 좋음.
  //기본값을 넣으려면 required를 빼야함
  TodoItem({required this.title, this.isDone = false});

  // toggleItem 2단계 코드 시작 메서드 실행되면 무조건 TodoItem객체 리턴하는 것.
  TodoItem copyWith({String? title, bool? isDone}) {
    return TodoItem(
      title: title ?? this.title,
      isDone: isDone ?? this.isDone,
    ); //null 이라면 원래 있던 값을 넣어라 //null이 들어왔다는건 변화할 값이 없다는 것 = 원래 값을 쓰겠다는 뜻 // 그래서 일부러 옵셔널을 허용한 것
  }
}
