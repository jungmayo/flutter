// 게시글 목록 화면에서 사용하는 뷰 모델 클래스이다. + 상태관리

// 게시글 목록은 회원가입 이동시, 로그인 페이지 이동시
// 뷰 모델 객체를 계속 가지고 있을 필요가 없음 새로운 게시글목록이 들어올 수 있기 때문에 계속 가지고 있을  필요가 없어서
// 자동으로 파괴해줘야한다.AutoDisposeNotifier
// AutoDisposeNotifier를 사용해야 하는 이유를 알자!!
// 똑같이 build를 호출해서 초기화해야함.
// 관리하는 타입은 <PostList> // r게시글이 하나도 없을 수 있으므로 optional로 만들 예쩡
import 'package:class_f_story/_core/utils/exception_handler.dart';
import 'package:class_f_story/_core/utils/logger.dart';
import 'package:class_f_story/data/model/post_list.dart';
import 'package:class_f_story/data/repository/post_repository.dart';
import 'package:class_f_story/main.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class PostListViewModel extends AutoDisposeNotifier<PostList?> {
  final postRepository =
      const PostRepository(); // 매번 새로운 힙에다가 postRepository 객체 계속 만들 필요가 없음 만들어둔 객체를 가져와서 쓰려면 const를 사용하면 된다.
  final mContext = navigatorkey.currentContext!;
  // 상태관리가 아닌 멤버 변수로 사용 된다.
  final refreshController =
      RefreshController(); // 내부적으로 stream이 들어가있음 -> stream : 계속 반복이니까 닫아줘야 된다는 의미

  @override
  PostList? build() {
    logger.d('PostListViewModel 초기화 메서드 호출 완료');

    // 콜백 메서드 등록
    ref.onDispose(
      () {
        // PostListViewModel이 Dispose 될때 콜백 호출이 될거고 dispose();
        // refreshController도 메모리 해제 처리
        // 메모리 누수 방지
        refreshController.dispose();
      },
    );
    init();
    // 초기값 설정
    return null;
  }

  // 게시글 목록으 뿌리는 초기화 작업 - 행위
  // 1. 예외처리
  // 2. API 호출
  // 3. success가 실패했을 때 처리
  // 4. success가 성공했을 때 처리 --> state 갱신 처리
  // 5. refreshController.loadCompleted() 호출 (동그라미 제거)
  Future<void> init() async {
    try {
      Map<String, dynamic> resBody = await postRepository.findAll();

      // 통신은 성공이지만 내부적으로 오류로 보고 서버에서 적절한 에러메세지를 던져주도록 설게되어있어서  그걸 호출 함
      if (!resBody['success']) {
        ExceptionHandler.handleException(
            resBody['errorMessage'], StackTrace.current);
        return; // 실행의 제어권 반납
      }
      // 통신성공 -->
      state = PostList.fromMap(resBody);
      refreshController.loadComplete();
    } catch (e, stackTrace) {}
  }
}
