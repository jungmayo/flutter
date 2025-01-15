import 'package:class_carrot_app/carrot_market_ui_04/screens/home/components/product_item.dart';
import 'package:flutter/material.dart';

import '../../models/product.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      // body: ListView.separated(itemBuilder: itemBuilder, separatorBuilder: separatorBuilder, itemCount: itemCount),
      // Listview.separated
      body: ListView.separated(
        itemBuilder: (BuildContext context, int index) {
          return ProductItem(product: productList[index]);
        },
        separatorBuilder: (BuildContext context, int index) {
          return Divider(
            height: 1,
            color: Colors.grey,
            indent: 15,
            endIndent: 15,
          );
        },
        itemCount: productList.length,
        // children: [
        //   ProductItem(product: productList[0]),
        // ],
      ),
      // child: Text('HomePage'),
    );
  }
}
