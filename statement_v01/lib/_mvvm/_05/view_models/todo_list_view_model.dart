// viewModel

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_statement_v01/_mvvm/_05/models/todo_item.dart';

// 1. 뷰 모델을 사용하고 있다.
// 2. 뷰 모델의 날개를 달아주자.(riverPod 상태관리 기능추가)
// 3. 우리의 규칙 뷰 모델 : 창고의 역할도 한다. // 빌드를 오버라이드 해주어야 한다.
// 4. 초반에 get,set 사용하지 말자.
// 창고 만들기
class TodoListViewModel extends Notifier<List<TodoItem>> {
  // List<TodoItem> _items = [];
  // super.state 안넘겨줘도 됨.
  @override
  List<TodoItem> build() {
    return []; // 이게 state가 된다.
  }

  // // get
  // List<TodoItem> get items => state;

  // 데이터 변경과 관련된 로직
  // 비즈니스 로직 (title을 받았음)Todo객체로 받아도되고...
  void addItem(String title) {
    // state.add --> 원래 사용하고 있는 객체에 접근해서 추가를 했었음
    // 위젯이 변경이 되지않았음. 하지만 새로운 객체를 만들어서 스프레드 연산자와 함께 할당하니 위젯 변경이 일어남.
    state = [...state, TodoItem(title: title)];
    // state.add(TodoItem(title: title));
  }

  // 0. 가변 객체를 변경해서 사용하는 코드
  // void toggleItem(TodoItem todo){
  //  todo.isDone = !todo.isDone;
  //  }

  // 상태관리를 다룰 때 불변 객체, 가변 객체 TodoItem --> 가변객체라 불변객체로 만들어서 넣어줘야 함.
  // 1단계 코드 - 불변 객체 할당
  // void toggleItem(TodoItem todo) {
  //   state = [
  //     for (final item in state)
  //       if (item == todo)
  //         TodoItem(
  //           title: item.title,
  //           isDone: !item.isDone,
  //         )
  //       else
  //         item
  //   ];
  // }

  // 2단계 코드 (깊은 복사를 해야함)
  // state 맵의 item을 돌때마다 item과 매개변수의 todo의 값이 같으면 item의 copyWith메서드를 호출 아니면 그대로 item --> map이기때문에 tolist로
  void toggleItem(TodoItem todo) {
    state = state
        .map(
            (item) => item == todo ? item.copyWith(isDone: !item.isDone) : item)
        .toList();
  }
}

// 불변성 원칙 위배(버그 위험 증가)
// 기존 리스트의 참조를 유지한 채 리스트 안에 특정 객체의 속성을 직접 수정 하는 것을 의미
// flutter 상태 관리에서는 가변 객체 대신 불변 객체를 사용한다.
//

// 3. 창고 관리자를 만들고 관리할 창고를 설정해주자 (TodoListViewModel을 창고로 확장)
final todoListViewModelProvider =
    NotifierProvider<TodoListViewModel, List<TodoItem>>(
  () {
    return TodoListViewModel();
  },
);
