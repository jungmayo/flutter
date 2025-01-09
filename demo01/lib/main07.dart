// 논리 연산자
void main() {
  bool isRainy = true;
  bool hasUmbrella = false;

  //and 연산자
  //둘 다 ture 여야 true --> false
  print(isRainy && hasUmbrella);

  // 애초에 먼저 false가 나오기 때문에 굳이 연산할 필요가 없기 때문에
  print(hasUmbrella && isRainy);

  // or 연산자 하나라도 true면 true
  print(isRainy || hasUmbrella);
  print(hasUmbrella || isRainy);

  // NOT
  print(!isRainy);
}
