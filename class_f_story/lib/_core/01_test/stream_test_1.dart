import 'dart:async';

//Future<T> 한번만 실행되고 완료되는 작업 , 한번만 비동기로 들어오면 끊어지는
//Stream<T> 여러개의 데이터를 순차적으로 계속 전달해서 사용할 수 있다.
void main() async {
  // How , Stream일때 async 별표! 반환할때 yield로
  // 데이터를 보내는 역할
  Stream<int> numberStream() async* {
    for (int i = 0; i < 3; i++) {
      await Future.delayed(Duration(seconds: 1));
      yield i;
    }
  }

  // 스트림을 구독해 보자 (데이터를 받은)
  await for (var number in numberStream()) {
    print('스트림 수신 : $number');
  }
}
