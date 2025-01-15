import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../../../../carrot_market_ui_04/theme.dart';
import '../../../models/product.dart';

class ProductDetail extends StatelessWidget {
  final Product product;
  const ProductDetail({required this.product, super.key});

  @override
  Widget build(BuildContext context) {
    //확장
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            product.title,
            style: textTheme().bodyLarge,
          ),
          const SizedBox(height: 4.0),
          Text(
            '${product.address} · ${product.publishedAt}',
          ),
          const SizedBox(height: 4.0),
          Text(
            '${numberFormat(product.price)}',
            style: textTheme().displayMedium,
          ),
          const Spacer(), // 남은 여백만큼 아래로 떨어트림
          // 좋아요,채팅 개수
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Visibility(
                  // 연산의 결과를 ture, false로
                  // 비교연산자 --> return 값은 boo
                  visible: product.commentsCount > 0,
                  child: _buildIcons(
                      product.commentsCount, CupertinoIcons.chat_bubble_2)),
              const SizedBox(width: 8.0),
              Visibility(
                  visible: product.heartCount > 0,
                  child: _buildIcons(product.heartCount, CupertinoIcons.heart)),
            ],
          )
        ],
      ),
    );
  }

  // 포멧 함수 만들어 보기
  String numberFormat(String price) {
    final formatter = NumberFormat('#,###');
    // 형변환처리 , 다트에는 기본데이터타입 x
    return formatter.format(int.parse(price));
  }

  Widget _buildIcons(int count, IconData mIcon) {
    return Row(
      children: [
        Icon(mIcon, size: 14.0),
        const SizedBox(width: 4.0),
        Text('$count')
      ],
    );
  }
}
