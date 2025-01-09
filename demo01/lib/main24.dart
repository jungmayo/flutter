// 팀장 또는 선임개발자가 물고기 소리나는 프로그램을 만들어 달라고 요청한 경우
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

// 신입이 작성 했다고 가정한 코드
class Fish {
  void hungry() {
    print('뻐끔뻐끔 배고파');
  }
}

void main() {
  Dog dog = Dog();
  Cat cat = Cat();
  Fish fish = Fish();

  //Fish.performAction(); 동적인 코드로 돌렸다면 오류 발생 됨..
  //팀장의 잘못
}
