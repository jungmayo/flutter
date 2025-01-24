import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_statement_v01/_mvvm/_06/product.dart';

// ProductView 위젯
class ProductView extends ConsumerWidget {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _quantityController = TextEditingController();

  ProductView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final products = ref.watch(ProductProvider);
    final productNotifier = ref.read(ProductProvider.notifier);

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          Row(
            children: [
              // 상품 이름 입력 필드
              Expanded(
                child: TextField(
                  controller: _nameController,
                  decoration: InputDecoration(
                    labelText: '상품 이름',
                  ),
                ),
              ),
              const SizedBox(width: 16),
              // 수량 입력 필드
              Expanded(
                child: TextField(
                  controller: _quantityController,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    labelText: '수량',
                  ),
                ),
              ),
              const SizedBox(width: 16),
              ElevatedButton(
                onPressed: () {
                  final name = _nameController.text.trim();
                  final quantity = int.tryParse(_quantityController.text) ?? 0;

                  productNotifier.addProduct(name, quantity);
                  _nameController.clear();
                  _quantityController.clear();
                },
                child: Text('등록'),
              ),
            ],
          ),
          const SizedBox(height: 16),
          Expanded(
            child: ListView.builder(
              itemCount: products.length,
              itemBuilder: (context, index) {
                final product = products[index];
                return ListTile(
                  title: Text('상품명 : ${product.name}'),
                  subtitle: Text('수량: ${product.quantity}'),
                  trailing: ElevatedButton(
                    onPressed: () {
                      productNotifier.purchase(product);
                    },
                    child: product.quantity > 0 ? Text('구매') : Text('품절'),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
