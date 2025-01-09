// 믹스인을 인스턴스화 시킬 때 사용하는 문법 (믹스인 뒤에 class를 붙여주면 됨)

mixin class Engine {
  int power = 5000;
}

mixin class Wheel {
  String wheelName = '4룬 구동 바퀴';
}

class BMW with Engine, Wheel {}

void main() {
  BMW bm1 = BMW();
  Engine e = Engine(); //믹스인 클래스는 인스턴스화 가능하다
  Wheel w = Wheel();
  print(bm1.power);
  print(bm1.wheelName);
}
