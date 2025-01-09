void main() {
  var n1 = 10;
  var n2 = 10.0;
  var n3 = true;
  var n4 = '정마요';

  print('n1 : ${n1.runtimeType}');
  print('n2 : ${n2.runtimeType}');
  print('n3 : ${n3.runtimeType}');
  print('n4 : ${n4.runtimeType}');

  dynamic c1 = 10;
  dynamic c2 = 10.0;
  dynamic c3 = true;
  dynamic c4 = '정마요';

  c1 = 40.4;

  print('c1 : ${c1.runtimeType}');
  print('c2 : ${c2.runtimeType}');
  print('c3 : ${c3.runtimeType}');
  print('c4 : ${c4.runtimeType}');
}
