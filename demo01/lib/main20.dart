// Mixin - 1 (사전 기반 지식)
// Dart에서 클래스의 코드를 여러 클래스에 계층에서 재사용할 수 있도록 해주는 코드 조각임
// 책 내용을
// Mixin을 사용하게 되면 다중 상속의 문제를 해결할 수 있고(자바에서는 허용 X) 컴퍼지션을 사용하지 않고
// 다른 클래스의 코드를 재사용 할 수 있다.

// OOP에서 객체 간의 관계를 정의하는 개념들
// 연관관계
// - 객체들이 서로 연결되어 있는 일반적인 관계
// - 컴포지션 관계
// - 집합관계

// 1-1 컴포지션
//    - 부분-전체 관계 중에서 생명주기(프로그램객체가 메모리에 올라가있는)가 밀접하게 연관된 '강한 소유 관계'를 의미 (인간/심장)
//    - 전체 객체가 소멸될 때 부분 객체도 함께 소멸됨
//    - 객체가 내부에서 생성되어야 함
//    - 예시 : 차와 엔진 클래스, 인간과 심장
//    [컴포지션 관계는 강한 소유 관계]

// 1-2 집합관계
//    - 부분-전체 관계 중에서 전체와 부분의 생명주기가 독립적인 관계를 의미
//    - 전체 객체가 소멸될 때 부분 객체는 독립적으로 존재할 수 있음
//    - 예시 : 부서와 직원 클래스를 생각할 수 있음
//    - 부서 객체가 소멸되더라도 직원 객체는 계속 존재할 수 있음
//    [집합관계는 약한 소유 관계]

// 2. 이니셜라이저 리스트 ( : )
// 이니셜라이저 리스트는 상속 관계뿐만 아니라
// 연관관계(집합관계 및 컴포지션 관계)에서도 클래스의 필드 초기화 및 객체 생성에
// 유용하게 사용할 수 있다.

class Engine {
  final String type;
  Engine(this.type); //생성자를 만들어 주어야함, 기본생성자는 컴파일 때 알아서 생성됨

  void startEngin() {
    print('${type} 엔진이 시동됩니다');
  }
}

//
class Car {
  final Engine engine; //final이라서 초기화 보장해야됨
  //Car(this.engine); // 완벽한 컴포지션 관계가 아님(생성자)

  //생성자 코드. 1. 축약버전 --> 생성자 바디부분을 생략했음
  // Car(String enginType) : engine = Engine(enginType); //받은 값을 주입시킬 수 있음 (1번)

  //생성자 코드. 2. 축약버전 --> 생성
  Car(String enginType) : engine = Engine(enginType) {
    print('생성자 호출 시 내부 스택 메모리가 호출 된다.');
  } //받은 값을 주입시킬 수 있음 (1번)

  void startCar() {
    engine.startEngin();
    print('차가 출발 합니다.');
  }
}

///////////////////////////////////////////////
// 집합 관계를 만들어 보자.
class Employee {
  final String name;
  Employee(this.name);

  void disPlayEmployeeInfo() {
    print('직원의 이름 : ${name}');
  }
}

class Department {
  final String deptName;
  final List<Employee> employees; // 객체자체를 생성한것은 X , 보관할 리스트를 초기화한 것

  //생성자
  Department(this.deptName) : employees = [] {
    print('=== Department 생성자 내부 스택 호출 ===');
  } //리터럴표기법 (자바에서 new List 이렇게 썼었음)

  //객체를 매개변수를 받고 있는데 이건 외부에 생성이 되어있어야 받을 수 있기 때문에 외부에서 생성된 것으로 볼 수 있음
  void addEmployee(Employee emp) {
    employess.add(emp);
  }

  void displayDepartmentInfo() {
    print("-----------------------");
    print("부서의 이름 : ${deptName}");
    for (var emp in employees) {
      emp.disPlayEmployeeInfo();
    }
  }
}

void main() {
  // Engine V8engin = Engine('v8기통');
  // Car car1 = Car(V8engin);
  /////////////////////////////
  Car car1 = Car('v8기통'); // 이렇게 동작 시키고 싶다면?
  // 누군가 car1을 참조하고 있지 않다면 GC 대상이 된다. (GC ? GarbageCollector) 스스로 메모리 회수

  print('-----------------');
  Department department1 = Department('개발부');
  Department department2 = Department('디자인부');
  Employee emp1 = Employee('정마요');
  Employee emp2 = Employee('정지현');
  Employee emp3 = Employee('김챱챱');

  department1.addEmployee(emp1);
  department1.addEmployee(emp2);
  department2.addEmployee(emp3);

  department1.displayDepartmentInfo();
}
