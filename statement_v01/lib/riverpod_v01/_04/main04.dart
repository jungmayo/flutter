import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_statement_v01/riverpod_v01/_04/book.dart';

void main() {
  runApp(ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyBookPage(),
    );
  }
}

class MyBookPage extends ConsumerWidget {
  const MyBookPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    String getBook = ref.watch(myBookStoreNotifierProvider);

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('${getBook}'),
            ElevatedButton(
              onPressed: () {
                MyBookStore notiStore =
                    ref.read(myBookStoreNotifierProvider.notifier);

                notiStore.changeData('김치전');
              },
              child: Text('변경'),
            ),
          ],
        ),
      ),
    );
  }
}

/**
 * 정리
 * Provider - 1회 알바생
 * - 데이터를 단순히 한 번 제공하는 역할, 상태가 변하지 않는 데이터를 관리할 때 사용
 *   즉, 주로 정적인 데이터를 제공할 때 사용 (단순 문자열, 정적 객체 등)
 *
 * StateNotifierProvider - 창고 관리자
 * - 상태 관리(state) 변경할 수 있는 창고 관리자 역할 -> 추상화 시켜서 사용하는거
 *   상태가 변경이 되면 이를 구동중인 모든 위젯에게 알려준다
 *   ref.read() 창고 자체에 접근할 수 있음
 *   ref.watch() 계속 구독하여 상태 변경을 감지함
 *
 * NotifierPorivder
 * - Riverpod 2.x 버전
 * - 상태를 관리하고 변경할 수 있는 창고 관리자 역할
 * - StateNotifierProvider의 개선된 버전
 */
