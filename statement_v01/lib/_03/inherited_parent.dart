// inheritedWidget 내장 데이터 타입을 상속 받아 구현 한다
import 'package:flutter/material.dart';
import 'package:flutter_statement_v01/common.utils/logger.dart';

class InheritedParent extends InheritedWidget {
  // 공유 상태 데이터를 관리하려는 목적이 있음
  // List<String> mySelectedBooks = [];
  List<String> state; // 카트에 담긴 책 목록(공유상태)
  // 부모의 콜백 메서드를 관리하는 목적
  void Function(String book) onPressed; // 이벤트 핸들러

  // HOW <-- 사용방법
  // WHY <-- required
  InheritedParent(
      {required this.state, required this.onPressed, required super.child});

  // 상태가 변경되었는지 여부를 판단하는 메서드
  // 주의점 ! InheritedWidget --> 재정의 클래스를 InheritedWidget 넣어주자
  //InheritedWidget안에 InheritedParent를 관리할 예정
  @override
  bool updateShouldNotify(covariant InheritedParent oldWidget) {
    logger.d('InheritedParent - updateShouldNotify() 호출확인');

    // 상태가 달라졌다면 어떻게 판별할까? oldWidget : 이전 위젯
    if (state.length != oldWidget.state.length) {
      logger.d('상태 변경 됨');
      return true;
    }
    for (int i = 0; i < state.length; i++) {
      // state --> 데이터타입 String --> '호모사피엔스'
      // state[i] --> String --> '호모사피엔스'
      if (state[i] != oldWidget.state[i]) {
        return true;
      }
    }
    // 상태 변경이 없으면 flase를 반환하여 자식 위젯을 다시 빌드 안되도록 한다.
    return false; // 상태 변경 없음이면 false를 반환하고 있으면 true를 반환
  }
}
