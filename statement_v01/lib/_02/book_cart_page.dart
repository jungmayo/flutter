import 'package:flutter/material.dart';

class BookCartPage extends StatelessWidget {
  // 사용자가 카드에 저장한 데이터만 화면에 뿌려주기
  final List<String> selectedBook;
  const BookCartPage({required this.selectedBook, super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
        children:
            selectedBook.map((book) => ListTile(title: Text(book))).toList());
  }
}
