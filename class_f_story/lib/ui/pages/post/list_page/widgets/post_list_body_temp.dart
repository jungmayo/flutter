// 로컬 상태 관리 (해당 페이지에서만 변경되는 데이터가 있다)
import 'package:flutter/material.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class PostListBodyTemp extends StatefulWidget {
  const PostListBodyTemp({super.key});

  @override
  State<PostListBodyTemp> createState() => _PostListBodyTempState();
}

class _PostListBodyTempState extends State<PostListBodyTemp> {
  // 사용자가 당기기, 사용자가 밑에서 올리기
  // 이벤트에 따라서 거기에 맞는 콜백 이벤트 함수를 호출해야 하는 것이 목적
  // _refreshController.refreshCompleted() <-- 새로 고침 완료 후 호출
  // loadCompleted() <-- 추가 데이터 로드 완료 후 호출

  RefreshController _refreshController = RefreshController();

  // 끌어당기기 끝나면 이벤트 끝 -> API 재요청 하는 방식으로 페이징 처리

  // 샘플 데이터
  List<Map<String, dynamic>> _posts = [
    {'id': 1, 'title': '1번째 게시글', 'content': '1번째 내용'},
    {'id': 2, 'title': '2번째 게시글', 'content': '2번째 내용'},
    {'id': 3, 'title': '3번째 게시글', 'content': '3번째 내용'},
    {'id': 4, 'title': '4번째 게시글', 'content': '4번째 내용'},
    {'id': 5, 'title': '5번째 게시글', 'content': '5번째 내용'},
    {'id': 6, 'title': '6번째 게시글', 'content': '6번째 내용'},
    {'id': 7, 'title': '7번째 게시글', 'content': '7번째 내용'},
    {'id': 8, 'title': '8번째 게시글', 'content': '8번째 내용'},
    {'id': 9, 'title': '9번째 게시글', 'content': '9번째 내용'},
    {'id': 10, 'title': '10번째 게시글', 'content': '10번째 내용'},
    {'id': 11, 'title': '11번째 게시글', 'content': '11번째 내용'},
    {'id': 12, 'title': '12번째 게시글', 'content': '12번째 내용'},
    {'id': 13, 'title': '13번째 게시글', 'content': '13번째 내용'},
    {'id': 14, 'title': '14번째 게시글', 'content': '14번째 내용'},
  ];

  @override
  Widget build(BuildContext context) {
    return SmartRefresher(
      controller: _refreshController,
      enablePullDown: true,
      onRefresh: _onRefresh,
      enablePullUp: true,
      onLoading: _onLoading,
      child: ListView.builder(
        itemCount: _posts.length,
        itemBuilder: (context, index) => ListTile(
          title: Text('${_posts[index]['title']}'),
          subtitle: Text('${_posts[index]['content']}'),
        ),
      ),
    );
  }

  // async * == stream API 쓸 때
  Future<void> _onRefresh() async {
    // 통신한다고 가정
    await Future.delayed(Duration(seconds: 1));
    // 데이터가 새로 들어옴
    setState(() {
      _posts = [
        ..._posts,
        {'id': 15, 'title': '15번째 게시글', 'content': '15번째 내용'},
        {'id': 16, 'title': '16번째 게시글', 'content': '16번째 내용'},
      ]; // 깊은 복사처리
    });
    _refreshController.refreshCompleted();
  }

  // 페이지 동작 처리( 무한 스크롤)
  // 사용자가 리스트를 맨 아래로 스크롤 할 때 이벤트 리스너 동작
  // 새로운 데이터를 API 호출해서 상태 갱신을 해주어야 한다.

  Future<void> _onLoading() async {
    await Future.delayed(Duration(seconds: 1));
    setState(() {
      // 기존에 있던 데이터를 추가로 값을 넣어서 화면 갱신을 하는 것
      // 기존의 데이터 타입 -- 통으로 List 이다.
      // 새로운 API 호출 시 --> 데이터 타입은 10개 -- List이다.
      // 기존에 있던 리스트에서 + 리스트를 하는 방법
      // 기존의 _posts에다가 _posts = _posts + []; 가 되는 것
      _posts.addAll(
        [
          {'id': 17, 'title': '17번째 게시글', 'content': '17번째 내용'},
          {'id': 18, 'title': '18번째 게시글', 'content': '18번째 내용'},
          {'id': 19, 'title': '19번째 게시글', 'content': '18번째 내용'},
          {'id': 20, 'title': '20번째 게시글', 'content': '18번째 내용'},
          {'id': 21, 'title': '21번째 게시글', 'content': '18번째 내용'},
          {'id': 22, 'title': '22번째 게시글', 'content': '18번째 내용'},
          {'id': 23, 'title': '23번째 게시글', 'content': '18번째 내용'},
        ],
      );
    });
    _refreshController.loadComplete();
  }

  // 화면 종료될 때 호출되는 생명주기를 가지고 있음
  // stream이 내부적으로 동작을 한다.
  //_refreshController 위젯이 제거될 때 메모리에서 해제해야한다.
  // 왜? 메모리 릭이 발생할 수 있다. (메모리 누수)
  @override
  void dispose() {
    _refreshController.dispose(); // 메모리 해제
    super.dispose();
  }
  // 화면을 이동해도 스트림 리스너가 계속 실행되기때문에 해제 해줘야 함.
// 중첩되면 메모리가 점점 증가하면서 앱이 느려진다.
}

//Future나 Stream을 사용하는 경우, 해당 비동기 작업이 완료된 후에는 dispose 메서드에서 클린업을 수행해야 합니다.
