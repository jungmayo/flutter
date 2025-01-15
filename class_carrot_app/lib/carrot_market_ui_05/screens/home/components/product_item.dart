import 'package:class_carrot_app/carrot_market_ui_05/screens/home/components/product_detail.dart';
import 'package:flutter/material.dart';
import 'product_detail.dart';
import '../../../models/product.dart';

//하나의 네모칸
class ProductItem extends StatelessWidget {
  final Product product;

  const ProductItem({required this.product, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 135.0,
      padding: EdgeInsets.all(16.0),
      child: Row(
        children: [
          //이미지
          ClipRRect(
            borderRadius: BorderRadius.circular(10.0),
            child: Image.network(
              product.urlToImage,
              width: 115,
              height: 115,
              fit: BoxFit.cover, //꽉 차게
            ),
          ),
          const SizedBox(width: 16),
          //상품 설명
          ProductDetail(product: product)
        ],
      ),
    );
  }
}
