import 'package:flutter/material.dart';

// 버튼 만들어 보기
// 상태가 있는 위젯을 만들어보자
// 1. StateFulWidget 위젯을 상속 받았다.
// 두 개의 클래스가 한 묶음이다.
class ProfileTab extends StatefulWidget {
  const ProfileTab({super.key});

  @override
  State<ProfileTab> createState() => _ProfileTabState();
} // end of ProfileTab

// 믹스인을 사용해서 해당클래스를 사용할 수 있도록함
class _ProfileTabState extends State<ProfileTab>
    with SingleTickerProviderStateMixin {
  //멤버 변수
  // _tabController는 TabBar와 TabBarview를 동기화 하는 컨트롤러이다.
  TabController? _tabController;

  // 단 한번 호출이 되는 메서드이다.
  @override
  void initState() {
    super.initState();
    print('프로필 탭 내부 클래스 init 호출 했다.');
    // length는 탭의 개수를 의미한다.
    // vsync는 자연스러운 애니메이션 전환을 위해서 TickerProvider를 활용한다.
    _tabController = TabController(length: 3, vsync: this);
  }
  //build 매소드는 기본적으로 그림을 그릴 때 호출이 된다.

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _buildTabBar(),
        Expanded(
          child: _buildTabBarView(),
        )
      ],
    );
  }

  TabBarView _buildTabBarView() {
    return TabBarView(
      controller: _tabController,
      children: [
        GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisSpacing: 10, //열(컬럼)사이의 간격을 10으로 설정
              mainAxisSpacing: 10, //행 (로우_)사이의 간격 설정
              crossAxisCount: 3),
          itemBuilder: (context, index) {
            //이미지를 불러와야한다.
            return Image.network('https://picsum.photos/id/${index}/200/200');
          },
          itemCount: 40,
        ),
        GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisSpacing: 10, //열(컬럼)사이의 간격을 10으로 설정
              mainAxisSpacing: 10, //행 (로우_)사이의 간격 설정
              crossAxisCount: 3),
          itemBuilder: (context, index) {
            //이미지를 불러와야한다.
            return Image.network('https://picsum.photos/id/${index}/200/200');
          },
          itemCount: 40,
        ),
        //꾸며주세요
        Container(
          width: 50,
          height: 100,
          child: GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                mainAxisSpacing: 5, crossAxisSpacing: 5, crossAxisCount: 5),
            itemBuilder: (context, index) {
              return Image.network('https://picsum.photos/id/${index}/200/200');
            },
          ),
        )
      ],
    );
  }

  TabBar _buildTabBar() {
    return TabBar(
      // 중간 매개체로 연결
      controller: _tabController,
      tabs: [
        Tab(
          icon: Icon(Icons.diamond),
        ),
        Tab(
          icon: Icon(Icons.star),
        ),
        Tab(
          icon: Icon(Icons.insert_emoticon_rounded),
        ),
      ],
    );
  }
} // end  ProfileTabState
