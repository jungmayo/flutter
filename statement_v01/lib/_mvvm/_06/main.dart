import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_statement_v01/_mvvm/_06/product_view.dart';

void main() {
  runApp(ProviderScope(child: ProductApp()));
}

class ProductApp extends StatefulWidget {
  const ProductApp({super.key});

  @override
  State<ProductApp> createState() => _ProductAppState();
}

class _ProductAppState extends State<ProductApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            title: Text('상품'),
          ),
          body: ProductView(),
        ),
      ),
    );
  }
}
