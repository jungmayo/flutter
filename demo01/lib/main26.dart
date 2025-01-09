// 추상 클래스

abstract class Shape {
  // 메서드의 바디(구현부)가 없다면 추상메서드이다.
  double getArea(); // dynamic getArea(); 도 가능
}
// 문제 : 면적을 구하는 일을 해결해야 한다.

class Circle implements Shape {
  final double radius;
  // 생성자는 가능한 축약형으로 만들자 - 우리들의 규칙
  Circle(this.radius);
  // 면적을 구하는 행위
  @override
  double getArea() {
    return 3.14 * radius * radius;
  }
}

class Rectangle implements Shape {
  final double width;
  final double height;

  Rectangle(this.width, this.height);
  // 면적을 구하는 행위
  @override
  double getArea() {
    return width * height;
  }
}

// 동적 바인을 활용한 함수를 설계해보자.
// 전역 함수
void calculaterArea(Shape s) {
  // 전달된 도형의 면적을 출력하시오.
  print(s.getArea());
}

void main() {
  Shape myCircle = Circle(5.0);
  Shape myRectangle = Rectangle(4.0, 6.0);
  calculaterArea(myCircle);
  calculaterArea(myRectangle);
}
