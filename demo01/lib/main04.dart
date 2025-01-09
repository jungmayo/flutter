// 상수 - 한번 할당된 값이 변경되지 않는 변수
// dart 에서는 final이라는 키워드와 const 키워드를 제공함
// 둘의 공통점은 값을 변경할 수 없지만 컴파일 시작인지 런타임 시점인지의 차이점이 있음
// fianl : 런타임 시점에서 값이 결정됨
// const : 컴파일 시점에서 값이 결정됨

//코드의 시작점
void main() {
  // final - 런타임 상수(Runt-time Constant)
  // 프로그램이 실행되는 도중에 값이 결정되며 이후에는 변경 불가
  final int n1 = 10;
  //n1 = 100; 이렇게 사용시 컴파일 시점에서 오류 발생

  // const - 컴파일 타임 상수(Compile-time Constant)
  // 코드가 컴파일 될 때 값이 확정되어짐

  const double d1 = 101.0;
  // d1 = 10.1; 변경 불가능

  // 상수 사용시 데이터 타입도 역시 생략 가능함
  final a1 = 100;
  const b1 = true;
} // end of main
