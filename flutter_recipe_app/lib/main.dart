import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

//상대경로를 사용하는 것이 좋음
import 'recipe_list_item.dart';
import 'recipe_menu.dart';
import 'recipe_title.dart';

// 플러터 코드의 시작점
void main() {
  // MyApp 위젯을 루트 위젯으로 만들어 주는 함수이다.
  // 사전 기반 지식 --- 위젯 트리를 떠올려야 함
  runApp(MyApp());
}

// 위젯을 만들 때 크게 2가지로 구분
// StatelessWidget 위젯은 상태 변경이 없는 위젯을 화면에 그릴 때 선택한다

// 상속문법 사용
// 우리들만의 약속 - MyApp -> 머터리얼 앱 객체를 활용하자.
class MyApp extends StatelessWidget {
  // 생성자 - 매개변수 이름 ( 선택적 명명 매개 변수) -> 값을 넣어도 되고 안 넣어도 됨
  MyApp({super.key});

  // 보통 루트 위젯을 시작할 때 MaterialApp을 많이 활용한다.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(fontFamily: 'PatuaOne'),
      // 앱 실행 되었을 때 첫 페이지를 지정할 수 있다.
      home: ReciepePage(),
    );
  }
} // end of class

// 우리들만의 규칙 2 - 페이지라고 이름 붙이는 클래스는 스캐아폴더를 활용하자.
class ReciepePage extends StatelessWidget {
  const ReciepePage({super.key});

  @override
  Widget build(BuildContext context) {
    // 시각적 레이아웃 구조를 잡아 주는 위젯
    // app 영역
    // body 영역
    // bottom 영역
    return Scaffold(
        appBar: _buildRecipeAppBar(),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: ListView(
            children: [
              RecipeTitle(),
              // 타이틀
              RecipeMenu(),
              // 메뉴
              RecipeListItem('coffee', 'Made Coffee'),
              RecipeListItem('burger', 'Made Burger'),
              RecipeListItem('pizza', 'Made Pizza'),

              // 레시피 아이템
              // 레시피 아이템
              // 레시피 아이템
            ],
          ),
        ));
  } // end of build method

  // 메서드를 만들어 보자
  // 접근제어 : private을 의미 (_)
  AppBar _buildRecipeAppBar() {
    return AppBar(
      backgroundColor: Colors.white,
      iconTheme: IconThemeData(
          color: Colors.black), // 하위에 color가 없으면 테마에 있는 color가 잡힐 수 있음
      // elevation: 1.0,
      actions: [
        Icon(CupertinoIcons.search, color: Colors.black),
        SizedBox(width: 8),
        Icon(CupertinoIcons.heart, color: Colors.red),
        SizedBox(width: 15)
      ],
    );
  }
}
