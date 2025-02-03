import 'package:class_f_story/_core/utils/exception_handler.dart';
import 'package:class_f_story/data/model/session_user.dart';
import 'package:class_f_story/data/repository/user_repository.dart';
import 'package:class_f_story/main.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// 뷰 모델 --> 화면에 있는 데이터를 가지고 와서 사용한다.
// 로그인 요청을 할 때 어떤 변수가 필요할까?

// 뷰모델의 속성 --> 세션 유저가 된다.
// 뷰모델의 행위 --> 로그인 행위, 로그아웃 행위, 자동 로그인 행위

class SessionGVM extends Notifier<SessionUser> {
  // 뷰 모델에서 컨텍스트를 사용하는 방법
  final mContext = navigatorkey.currentContext!;
  UserRepository userRepository = UserRepository();

  // 선언형 UI이기 때문에 상태를 초기화 해주어야 한다.
  @override
  SessionUser build() {
    // 추상화 변수 state(외부에서 접근하는 변수명)
    // 즉 state는 ==> SessionUser()객체가 된다.
    return SessionUser(
      id: null,
      username: null,
      accessToken: null,
      isLogin: false,
    );
  }

  // 로그인 행위
  // 화면에서 뷰 모델에게 로그인 요청 위임
  Future<void> login(String username, String password) async {
    // 서버측으로 던질 데이터를 구축해야 한다.
    try {
      // 요청 HTTP 메세지 body
      final body = {
        //맵구조로
        'username': username,
        'password': password,
      };
      final (responseBody, accessToken) =
          await userRepository.findByUsernameAndPassword(body);

      if (responseBody['success'] == false) {
        // 사용자에게 로그인 실패 (비번 X, 사용자명 X)
        // 서버측에서 통신은 성공했으나 내부 오류로 판단
        ExceptionHandler.handleException(
            responseBody['errorMessage'], StackTrace.current);
        return; // 실행의 제어권 반납
      }
    } catch (e) {}
  }

  // 로그아웃 행위
}
