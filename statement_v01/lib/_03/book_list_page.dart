import 'package:flutter/material.dart';
import 'inherited_parent.dart';
import 'package:flutter_statement_v01/common.utils/logger.dart';

class BookListPage extends StatelessWidget {
  //객체가 태어날때 부모와 연결 (String을 매개변수로)
  BookListPage({super.key});

  // 임시 데이터 - 교보문고의 볼 수 있는 책 목록
  final List<String> books = [
    '호모사피엔스',
    '다트입문',
    '홍길동전',
    '코드리펙토링',
    '전치사도감',
  ];

  @override
  Widget build(BuildContext context) {
    //BuildContext를 사용하여 우리가 정의한 InheritedParents 위젯에 접근할 수 있다.
    InheritedParent? inheritedParent =
        context.dependOnInheritedWidgetOfExactType();

    // 공유 상태 데이터 -> 즉, 카트에 넣어둔 String 값을 가지고 와야함
    // 초기값 빈 배열로 설정
    List<String> selectedBook = inheritedParent?.state ?? [];

    // logger.d('데이터 확인 : ${selectedBook.toString()}');
    return inheritedParent == null
        ? Center(child: Text('데이터가 없음'))
        : ListView(
            children: books.map(
              // book <-- books의 0번째 인덱스는 호모사피엔스
              (book) {
                // 함수의 바디에는 식을 작성할 수 있다.
                // 사용자가 장바구니에 넣었는지 안넣었는지 어떻게 확인할 수 있을까

                // 부모가 관리하는 장바구니 데이터에 book이란 데이터가 있는가 없는가 체크하고 싶음
                final isSelectedBook = selectedBook.contains(book);

                return ListTile(
                  leading: Container(
                    width: 35,
                    height: 35,
                    decoration: BoxDecoration(
                      color: Theme.of(context).secondaryHeaderColor,
                      borderRadius: BorderRadius.circular(8.0),
                      border: Border.all(color: Colors.black),
                    ),
                  ),
                  title: Text(
                    book,
                    style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
                  ),
                  trailing: IconButton(
                    onPressed: () {
                      // 부모에게 콜백을 호출하는데 데이터도 함게 전달해야 함
                      inheritedParent.onPressed(book);
                      //onToggleSaved 함수
                    },
                    icon: Icon(
                      //isSelectedBook --> map 안의 지역 변수
                      isSelectedBook ? Icons.remove_circle : Icons.add_circle,
                      color: isSelectedBook ? Colors.red : Colors.green,
                    ),
                  ),
                );
              },
            ).toList(),
          );
  }
}
