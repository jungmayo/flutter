import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_statement_v01/main.dart';
import 'package:flutter_statement_v01/riverpod_v01/_03/book.dart';

void main() {
  runApp(ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: BookPage(),
    );
  }
} // end of MyApp

// cousumerWidget으로
class BookPage extends ConsumerWidget {
  const BookPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    String book = ref.watch(myBookStoreProvider);
    return SafeArea(
        child: Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('${book}'),
            ElevatedButton(
                onPressed: () {
                  MyBookStore store = ref.read(myBookStoreProvider.notifier);
                  store.changeData('고양이책');
                },
                child: Text('책상태 변경시켜보기'))
          ],
        ),
      ),
    ));
  }
}
