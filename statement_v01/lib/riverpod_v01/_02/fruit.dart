import 'package:flutter_riverpod/flutter_riverpod.dart';

// 1. 창고 안에서 관리할 데이터 선정
// 기본 데이터 타입, 클래스 묶음
String fruit = '사과';

// 2. 창고안에서 fruit를 관리할거라서 창고를 만들자! FruitStore로!
// 창고를 만들 때 규격이 있다. 그 이름은 StateNotifier 이다
class FruitStore extends StateNotifier<String> {
  // super.state (fruit을 의미 추상화 시켜서 변수명을 state로 바꾸는 것임)
  // super.state는 전달 받은 data를 상태로 등록시키는 과정이다.(상품을 바코드로 등록하듯이)
  FruitStore(super.state);
  //String에 super.state를 전달하고 있음
  // 창고 안에는 관리할 상품도 존재할 수 있고 편하게 관리할 머신도 존재할 수 있다.
  // 창고 안의 데이터를 변경할 수 있는 기능을 만들어 주자 = 머신

  // 나중에 ata에 다른 값을 넣어주면서 state값을 변경할 수 있음
  void changeData(String data) {
    super.state = data;
  }
}

// 3. 창고 관리자에게 창고를 등록하고 관리하도록 설정하자. (provider 설정해야 함)
final fruitProvider = StateNotifierProvider<FruitStore, String>(
  (ref) => FruitStore(fruit),
);
