// 믹스인 사용해보기
// 여러 계층에서 코드를 재사용할 수 있도록 하는 '코드 조각'을 의미

mixin Engine {
  int power = 5000;
}
mixin Wheel {
  String wheelName = '4륜 구동 바퀴';
}

// 믹스인을 가져올 땐 extends가 아니라 with로 가져옴
class BMW with Engine, Wheel {}

void main() {
  // 인스턴스화 시킴 컴파일 시점에  engie과 wheel의 코드 조각을 담은 새로운객체가 메모리에 올라간것
  BMW bm1 = BMW();
  print(bm1.power);
  print(bm1.wheelName);

  // 상속 구조를 사용하면 단일 상속만 허용, 근데 믹스인을 사용하면 여러 계층에서
  // 코드의 조각들을 편하게 가져올 수 있다.
  // 단 믹스인은 maxin Engine 이 인스턴스화 되는 것은 아니다! (메모리에 인스턴스화 시키는게 아님)
  //Wheel wheel1 = Wheel(); 이게 안된다는 뜻, 믹스인은 인스턴스화 시킬 수 없다.
}
