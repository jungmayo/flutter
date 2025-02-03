// API 서버의 기본 URL 설정
// 전역 변수 사용

import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

final baseUrl = 'http://192.168.0.36:8080';

final dio = Dio(
  BaseOptions(
    baseUrl: baseUrl,
    contentType: 'application/json;charset=utf-8',
    // 주의 ! 200 번 이외에는 모두 에러로 간주 하게 기본값 설정되어있음
    // 다른 상태 코드 다 허용
    validateStatus: (status) => true,
  ),
);

// 중요 데이터 보관소 (금고 생성)
// 로컬에 민감한 데이터를 보관하는 안전한 금고 역할을 한다.
const secureStorage = FlutterSecureStorage(); // 예) Jwt토큰
