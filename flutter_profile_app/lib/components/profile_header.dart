import 'package:flutter/material.dart';

class ProfileHeader extends StatelessWidget {
  const ProfileHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const SizedBox(width: 20),
        _buildHeaderAvatar(),
        const SizedBox(width: 20),
        _buildHeaderProfile()
      ],
    );
  }

  //컨트롤 + ww -> 컴트롤+알트+m / 따로 메서드로 뺐음
  Column _buildHeaderProfile() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '정마요',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
        ),
        Text(
          '프로게이머/집사',
          style: TextStyle(fontSize: 15, fontWeight: FontWeight.w700),
        ),
        Text(
          '데어 프로그래밍',
          style: TextStyle(fontSize: 10, fontWeight: FontWeight.w700),
        ),
      ],
    );
  }

  SizedBox _buildHeaderAvatar() {
    return SizedBox(
      width: 100,
      height: 100,
      child: CircleAvatar(
        // AssetImage는 보통 위젯의 배경으로 동작할 때, 꾸밀 때
        // 많이 활용하는 위젯이다.
        backgroundImage: AssetImage('assets/KakaoTalk_20250108_115109220.jpg'),
      ),
    );
  }
}
