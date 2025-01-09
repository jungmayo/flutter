//코드의 시작점
void main() {
  // 타입 확인 - runtimeType 의 활용
  // 디버깅 및 오류 방지할 때 사용
  // 예상치 못한 타입의 값이 들어올 경우, 프로그램이 제대로 동작하지 않을 수 있음
  // runtimeType을 활용해서 타입 체크를 할 수 있음

  int n1 = 10; //기본 데이터타입도 객체라서 .연산자를 쓸 수 있음
  double d1 = 10.0;
  bool b1 = true;
  String name = '정마요'; //홑 따옴표 권장 사항\

  print('정수 : ${n1.runtimeType}');
  print('실수 : ${d1.runtimeType}');
  print('정수 : ${b1.runtimeType}');
  print('정수 : ${name.runtimeType}');
}
