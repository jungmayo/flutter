import 'package:flutter_riverpod/flutter_riverpod.dart';

class Product {
  final String name;
  final int quantity;
  bool isAvailable;

  Product(
      {required this.quantity, required this.isAvailable, required this.name});

// copyWith 메서드 추가
  Product copyWith({String? name, int? quantity, bool? isAvailable}) {
    return Product(
        quantity: quantity ?? this.quantity,
        isAvailable: isAvailable ?? this.isAvailable,
        name: name ?? this.name);
  }
}

// 사실 창고가 --> 뷰 모델 입니다.
//창고 만들기
class ProductNotifier extends Notifier<List<Product>> {
  @override
  List<Product> build() {
    // 초기값 설정
    return []; // 이게 state가 된다.
  }

  // 상품 추가시 수량도 함께 추가 (구매 버튼 생성) 눌렀을 대 수량 -1 -> 0이되면 품절버튼으로 변경
  // 메서드 상품 + 수량 추가 메서드
  void addProduct(String name, int quantity) {
    state = [
      ...state,
      Product(
        name: name,
        quantity: quantity,
        isAvailable: true,
      )
    ];
  }

  void purchase(Product product) {
    state = state
        .map((item) => item == product && item.quantity > 0
            ? item.copyWith(quantity: item.quantity - 1)
            : item.copyWith(isAvailable: item.isAvailable = false))
        .toList();
  }

  // 재고 여부 변경 toggleIsAvailable(int index)
  // remoteProduct(int index)
}

// 창고 관리자
final ProductProvider =
    NotifierProvider<ProductNotifier, List<Product>>(() => ProductNotifier());
