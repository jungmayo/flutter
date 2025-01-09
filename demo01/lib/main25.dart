// Animal 추상클래스를 구현해서 만들어 줘 라고 부탁했어야 했다.
// 팀장이 먼저 설계를 했었어야 했음.

// 메모리에 올릴 수 없음 ( 인스턴스 x, 추상클래스, 추상메서드 )
abstract class Animal {
  void performAction();
}

// 추상클래스를 구현할 때 implements를 사용한다가 규칙
class Dog implements Animal {
// 추상클래스는 추상메서드를 가지고있어야함
// 일반클래스는 추상메서드를 가지고 있으면 안됨 -> 오버라이딩을 하거나 클래스를 abstract를 하면 됨
  @override
  void performAction() {
    print('멍멍 배고파');
  }
}

class Cat implements Animal {
  @override
  void performAction() {
    print('야옹 배고파');
  }
}

class Fish implements Animal {
  @override
  void performAction() {
    print('뻐끔 배고파');
  }
}

// 한단계 더 실력을 쌓아 보자
// 동적 바인딩이란? 런타임시점에 들어오는 객체가 동적으로 들어와서
void start(Animal a) {
  // performActio() 메서드가 동작하게 만들고 싶어
  // 단 강아지든 고양이든 물고기든 동적으로 들어 오더라도
  // performAction() 호출 되게 설계해야 한다.
  a.performAction();
}

void start1(Cat c) {
  c.performAction();
}

void start2(Dog d) {
  d.performAction();
}

void start3(Fish f) {
  f.performAction();
}

void main() {
  start(Dog());
  start(Cat());
  start(Fish());
}
