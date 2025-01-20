import 'package:flutter/material.dart';
import 'package:flutter_statement_v01/_03/book_cart_page.dart';
import 'package:flutter_statement_v01/_03/book_list_page.dart';
import 'package:flutter_statement_v01/_03/inherited_parent.dart';
import 'package:flutter_statement_v01/common.utils/logger.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // 로컬 상태 : 하단에 활동화 된 탭 인덱스 번호
  int pageIndex = 0;
  // 상품 --> 책(String 타입으로 관리 예정 -> 이후 클래스로 묶기)

  // 공유 상태 카트에 담긴 책 정보(책 리스트 화면, 장바구니 화면에서 공유하는 데이터)
  // 배열로 변수 선언 + 초기화
  List<String> mySelectedBook = [];

  // 상태를 변경할 수 있는 메서드 만들기 (토글)
  void _toggleSaveStates(String book) {
    // 다시 화면을 그려라 요청 함수
    setState(() {
      if (mySelectedBook.contains(book)) {
        mySelectedBook.remove(book);
      } else {
        mySelectedBook.add(book);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    logger.d('홈스크린 메서드 호출됨');
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('텐코의 서재'),
          backgroundColor: Theme.of(context).colorScheme.tertiaryContainer,
        ),
        body: InheritedParent(
          // myselectedBook, _toggleSaveStates를 넘겨줌
          state: mySelectedBook,
          onPressed: _toggleSaveStates,
          // super.child
          child: IndexedStack(
            // 반드시 추가해야 되는 속성
            // 페이지라는 인덱스로 로컬상태를 사용하고 있음
            index: pageIndex,
            children: [
              BookListPage(
                  //_toggleSaveStates, 와 _toggleSaveStates()의 차이점은?
                  // 1은 메서드 자체를 전달
                  // 2는 return 값을 전달하는 것

                  ),
              BookCartPage(),
            ],
          ),
        ),
        bottomNavigationBar: BottomNavigationBar(
          // 필수 속성
          currentIndex: pageIndex,
          onTap: (index) {
            // 행위 .. 생략..
            setState(() {
              pageIndex = index;
            });
          },
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.list),
              label: 'book_list',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.shopping_cart),
              label: 'cart',
            ),
          ],
        ),
      ),
    );
  }
}
