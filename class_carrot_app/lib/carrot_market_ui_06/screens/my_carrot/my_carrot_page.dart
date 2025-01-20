import 'package:class_carrot_app/carrot_market_ui_06/models/icon_menu.dart';
import 'package:class_carrot_app/carrot_market_ui_06/screens/components/appbar_preferred_size.dart';
import 'package:class_carrot_app/carrot_market_ui_06/screens/my_carrot/components/card_icon_menu.dart';
import 'package:class_carrot_app/carrot_market_ui_06/screens/my_carrot/components/my_carrot_header.dart';
import 'package:flutter/material.dart';

class MyCarrotPage extends StatelessWidget {
  const MyCarrotPage({super.key});

  @override
  Widget build(BuildContext context) {
    print('MyCarrotPage() 메모리 호출 확인');
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        title: Text('나의 당근'),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.settings, color: Colors.grey),
          )
        ],
        bottom: appBarBottomLine(),
      ),
      body: ListView(
        children: [
          // 헤더
          MyCarrotHeader(),
          const SizedBox(height: 8.0),
          CardIconMenu(iconMenuList: iconMenu1),
          const SizedBox(height: 8.0),
          CardIconMenu(iconMenuList: iconMenu2),
          const SizedBox(height: 8.0),
          CardIconMenu(iconMenuList: iconMenu3),
          // 아이콘 메뉴 1 - 카드 레이아웃
          // 아이콘 메뉴 2 - 카드 레이아웃
          // 아이콘 메뉴 3 - 카드 레이아웃
        ],
      ),
    );
  }
}
