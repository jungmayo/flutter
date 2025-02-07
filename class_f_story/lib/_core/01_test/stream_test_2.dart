import 'dart:async';

// async* + yield 간단한 스트림 생성
// StreamController 조금 복잡한 스트림 생성할 때 사용할 수 있다.
void main() async {
  // 1. Stream 컨트롤러 생성
  StreamController<String> streamController = StreamController();
  //기본생성자만
  // 청취 <-- 대기 <-- 이벤트 리스너 등록 (스트림 종료할 때까지 대기시킬 수 있음)
  streamController.stream.listen(
    (event) {
      // 어떤 일을 수행하라고 정의내리기
      print('event 확인 : ${event}');
    },
  );

  // 스트림을 통해서 이벤트를 전달해 보자. 컨트롤러.add 를 통해서!! Listen의 콜백함수로 전달
  await Future.delayed(Duration(seconds: 1));
  streamController.add('나의 데이터 1');

  await Future.delayed(Duration(seconds: 1));
  streamController.add('나의 데이터 2');

  await Future.delayed(Duration(seconds: 1));
  streamController.add('나의 데이터 3');
}
