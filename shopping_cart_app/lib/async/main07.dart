void main() async {
  await animal();
  print('메인함수종료');
}

Future<void> animal() async {
  print('이거 나와?');
  await Future.delayed(Duration(seconds: 3), () {
    var result = '고양이';
    print("이 동물은 : ${result}");
  });
}
