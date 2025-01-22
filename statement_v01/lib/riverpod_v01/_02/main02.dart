import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_statement_v01/common.utils/logger.dart';
import 'package:flutter_statement_v01/riverpod_v01/_02/fruit.dart';

void main() {
  // 1. riverpdd을 사용하기 위해 ProviderScope로 감싼다.
  runApp(ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: FruitPage(),
    );
  }
} // end of Myapp

// 2. 리버팟을 사용하시 위해서 소비자 ConsumerWidget으로 변경해야 한다.
class FruitPage extends ConsumerWidget {
  const FruitPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // 사용하는 측 코드에서 배운 2가지
    // ref.read(), ref.watch()
    // 한번만 데이터를 가져오려면 read를 사용해야한다.
    // String getFruite = ref.read(fruitProvider); // 상태 변경이 더이상 안되기 때문에 빌드를 더이상 호출하지 않는다.
    String getFruite = ref.watch(fruitProvider); // 상태 변경이 되면 계속 알림을 받는다.
    logger.d('getFruit 확인 : ${getFruite}');
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('data 확인 : ${getFruite}'),
              ElevatedButton(
                onPressed: () {
                  // 상태 변경 기능
                  // 데이터를 가지고 오는게 아니라 창고 자체를 들고 와서 그 안의
                  // 머신을 동작 시켜야 한다.
                  // read() 메서드는 데이터를 한번 들고 오기도 하지만 창고 자체에 접근할 수도 있음.
                  // 창고프로바이더의 창고에 접근
                  FruitStore fruitStore = ref.read(fruitProvider.notifier);
                  fruitStore.changeData('포도');
                },
                child: Text('딸기로 상태 변경하기'),
              )
            ],
          ),
        ),
      ),
    );
  }
}

/*
*  정리
*   Provider (01 예제) - 1회 알바생
*   데이터를 단순히 한 번 제공하는 역할, 상태가 변하지 않는 데이터를 관리할 때 쓰며
*   즉, 주로 정적인 데이터를 제공할 때 사용한다.
*   (비교적 간단한 단순 문자열 정적 객체 등)
*
*   2. 상태관리
*   StateNotifierProvider(02 예제) - 창고 관리자
*   상태를 관리(State : 추상화) 변경할 수 있는 창고 관리자 역할이다.
*   상태(State)가 변경이 되면 이를 구독(watch)중인 모든 위젯에게 알려준다.
*   ref.read() 창고 (FruiteStore) 자체에 접근할 수 있고
*   ref.watch()는 계속 구독하여 상태 변경을 감지할 수 있다.
* */
