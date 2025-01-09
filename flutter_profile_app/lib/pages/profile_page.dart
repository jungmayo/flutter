import 'package:flutter/material.dart';
import 'package:flutter_profile_app/components/profile_buttons.dart';
import 'package:flutter_profile_app/components/profile_count_info.dart';
import 'package:flutter_profile_app/components/profile_header.dart';
import 'package:flutter_profile_app/components/profile_tab.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('profile'),
      ),
      //오른쪽에서 나타나는 드로어를 정의(원래 햄버거모양)
      endDrawer: Container(
        width: 200,
        color: Colors.white,
        child: ListView(
          children: [
            Container(
              height: 100,
              child: DrawerHeader(
                decoration: BoxDecoration(
                  color: Colors.blue, // 헤더 배경색
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Menu Header',
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    ),
                    Text(
                      'Additional Info',
                      style: TextStyle(color: Colors.white, fontSize: 14),
                    ),
                  ],
                ),
              ),
            ),
            ListTile(
              leading: Icon(Icons.home, color: Colors.blue),
              title: Text('Home'),
              onTap: () {
                Navigator.pop(context); // endDrawer 닫기
                print('Home clicked');
              },
            ),
            ListTile(
              leading: Icon(Icons.settings, color: Colors.blue),
              title: Text('Settings'),
              onTap: () {
                Navigator.pop(context);
                print('Settings clicked');
              },
            ),
            ListTile(
              leading: Icon(Icons.logout, color: Colors.blue),
              title: Text('Logout'),
              onTap: () {
                Navigator.pop(context);
                print('Logout clicked');
              },
            ),
          ],
        ),
      ),
      body: Column(
        children: [
          const SizedBox(height: 20),
          //공백20
          ProfileHeader(),
          //프로필 헤더,
          const SizedBox(height: 20),
          //공백20
          ProfileCountInfo(),
          //프로필 카운트 정보
          const SizedBox(height: 20),
          // 공백 20
          ProfileButtons(),
          // 프로필 버튼 2개
          Expanded(child: ProfileTab()),
          // 탭바영역
        ],
      ),
    ));
  }
}
