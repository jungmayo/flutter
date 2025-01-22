import 'package:flutter_riverpod/flutter_riverpod.dart';

// 1. 창고에 넣을 데이터 선언
String myBook = '홍길동전';

// 2. 창고를 만들자 (규격 - Notifier)
class MyBookStore extends Notifier<String> {
  // riverpod 2.x 버전에 있는 build 함수
  @override
  String build() {
    // 초기값을 세팅 --> 상태 관리
    return myBook;
  }

  // 이미 state가 super.state = myBook; 로 세팅
  // 내부에서 state 변수 사용 가능

  // 창고안에 머신
  void changeData(String book) {
    state = book;
  }
}

// 3. 창고 관리자에게 창고를 등록하고 관리하도록 설정
final myBookStoreNotifierProvider = NotifierProvider<MyBookStore, String>(
  () {
    return MyBookStore();
  },
);
