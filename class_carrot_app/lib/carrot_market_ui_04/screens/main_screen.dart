import 'package:flutter/cupertino.dart';

import 'chatting/chatting_page.dart';
import 'home/home_page.dart';
import 'my_carrot/my_carrot_page.dart';
import 'near_me/near_me_page.dart';
import 'neighborhood_life/neighborhood_page.dart';
import 'package:flutter/material.dart';

// 바텀네비게이션을 들고 있다.
class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0; // 현재 선택된 탭의 인덱스를 저장하는 변수

  // 상태(속성)은 행위를 통해서 변경해야 한다.
  void changeStackPages(int index) {
    setState(() {
      _selectedIndex = index; // 탭 변경시 상태 업데이트 build() 재 호출
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: IndexedStack(
          // 현재 선택된 인덱스 번호 설정
          index: _selectedIndex,
          children: [
            HomePage(),
            NeighborhoodLifePage(),
            NearMePage(),
            ChattingPage(),
            MyCarrotPage(),
          ],
        ),
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Colors.white,
          // 동일한 크기의 탭을 만들어 준다.
          type: BottomNavigationBarType.fixed,
          // 현재 선택된 인덱스 번호를 명시
          currentIndex: _selectedIndex,
          onTap: (index) {
            changeStackPages(index);
          },
          items: [
            BottomNavigationBarItem(
              label: '홈',
              icon: Icon(CupertinoIcons.home),
            ),
            BottomNavigationBarItem(
              label: '동네생활',
              icon: Icon(CupertinoIcons.square_on_square),
            ),
            BottomNavigationBarItem(
              label: '내 근처',
              icon: Icon(CupertinoIcons.placemark),
            ),
            BottomNavigationBarItem(
              label: '채팅',
              icon: Icon(CupertinoIcons.chat_bubble_2),
            ),
            BottomNavigationBarItem(
              label: '나의 당근',
              icon: Icon(CupertinoIcons.person),
            ),
          ],
        ),
      ),
    );
  }
}
