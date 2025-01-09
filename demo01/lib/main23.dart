// 추상 클래스
// 추상적인 클래스, 때문에 인스턴스화 시킬 수 없다(메모리에 올릴 수 없다)
/*
  추상 클래스는 완전한 구현들을 제공하는 않는 클래스로
  상속을 통해 다른 클래스가 이를 확장하여 구체적인 동작을
  강제할 수 있는 클래스임.
  추상 클래스는 좀 더 일반화적인 개념을 표현하며, 공통된 속성과 메서드를 정의하는데
  보통 많이 활용한다.
 */
// 시나리오 코드 1
// 일반 클래스를 만들어보자

// 유아용 동물 소리 프로그램을 간단하게 만들어 보자
class Dog {
  void performAction() {
    print('멍멍 배고파');
  }
}

class Cat {
  void performAction() {
    print('야옹 야옹 배고파');
  }
}

void main() {
  Dog dog = Dog();
  Cat cat = Cat();
  dog.performAction();
  cat.performAction();
}
