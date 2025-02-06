import 'package:class_f_story/_core/constatants/size.dart';
import 'package:class_f_story/data/gvm/session_gvm.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CustomDrawer extends ConsumerWidget {
  //Scaffold 상태를 관리해주는
  final GlobalKey<ScaffoldState> scaffoldKey;

  const CustomDrawer(this.scaffoldKey, {super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // 뷰 모델 들고오기
    SessionGVM vm = ref.read(sessionProvider.notifier);

    return Container(
      height: double.infinity,
      width: getDrawerWidth(context),
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextButton(
              onPressed: () {
                // 기능1 -> Drawer 닫기
                // 기능2 -> 글쓰기 페이지로 이동처리
                scaffoldKey.currentState!.openEndDrawer();
                // 글쓰기 페이지 이동처리
                Navigator.pushNamed(context, '/post/write');
              },
              child: Text(
                '글쓰기',
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.black54),
              ),
            ),
            const Divider(),
            TextButton(
              onPressed: () async {
                // 로그아웃 호출
                await vm.logout();
                // 코드가 없음
                // 만약 있다면 vm.logout();수행되고 아래로 내려와야 한다면 await 걸 수 있음
              },
              child: Text(
                '로그아웃',
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.black54),
              ),
            ),
            const Divider(),
          ],
        ),
      ),
    );
  }
}
