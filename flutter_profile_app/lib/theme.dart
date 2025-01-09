import 'package:flutter/material.dart';
// 보통 협업 --> 디자이너
// 전역 함수로 만들어 보자

const MaterialColor primaryWhite = MaterialColor(
  0xFFFFFFFF, // 기본 색상
  <int, Color>{
    50: Color(0xFFFFF8F8), // 밝은 흰색
    100: Color(0xFFFFF3F3), // 조금 더 어두운 흰색
    200: Color(0xFFFFEEEE), // 연한 회색 느낌
    300: Color(0xFFFFE8E8), // 더 어두운 회색
    400: Color(0xFFFFE3E3), // 중간 명도
    500: Color(0xFFFFFFFF), // 기본 흰색
    600: Color(0xFFE0E0E0), // 약간 어두운 흰색
    700: Color(0xFFCCCCCC), // 더 어두운 회색
    800: Color(0xFFB3B3B3), // 명도 더 낮춤
    900: Color(0xFF999999), // 가장 어두운 회색
  },
);

// 전역 함수
ThemeData theme() {
  // 앱 전반적인 테마(색상, 글꼴, 위젯 스타일 등)를 정의하는 클래스
  // 전체적으로 일관된 디자인을 유지하기 위해서 선언
  return ThemeData(
      // 앱의 기본 색상 팔레트를 설정하는 속성
      primarySwatch: primaryWhite,
      appBarTheme: const AppBarTheme(
        iconTheme: IconThemeData(color: Colors.blue),
      ));
}
