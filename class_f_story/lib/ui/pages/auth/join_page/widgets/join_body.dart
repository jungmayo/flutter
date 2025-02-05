import 'package:class_f_story/_core/constatants/size.dart';
import 'package:class_f_story/data/gvm/session_gvm.dart';
import 'package:class_f_story/ui/pages/auth/login_page/login_page.dart';
import 'package:class_f_story/ui/widgets/custom_auth_text_form_field.dart';
import 'package:class_f_story/ui/widgets/custom_elevated_button.dart';
import 'package:class_f_story/ui/widgets/custom_logo.dart';
import 'package:class_f_story/ui/widgets/custom_text_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class JoinBody extends ConsumerWidget {
  final _usernameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  JoinBody({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // 회원 테스트를 위한 코드 설정
    _usernameController.text = 'aaa1';
    _emailController.text = 'aa@naver.com';
    _passwordController.text = '1234';

    // 뷰 모델(창고) 자체에 접근
    SessionGVM gvm = ref.read(sessionProvider.notifier);
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ListView(
        children: [
          const CustomLogo('f-story'),
          CustomAuthTextFormField(
            text: 'Username',
            controller: _usernameController,
          ),
          const SizedBox(height: mediumGap),
          CustomAuthTextFormField(
            text: 'Email',
            controller: _emailController,
          ),
          const SizedBox(height: mediumGap),
          CustomAuthTextFormField(
            text: 'Password',
            controller: _passwordController,
            obscureText: true,
          ),
          const SizedBox(height: largeGap),
          CustomElevatedButton(
            text: '회원 가입',
            click: () {
              // 사용자의 입력값을 추출해서
              // 뷰 모델에게 회원 등록 요청 코드 작성
              gvm.join(
                _usernameController.text.trim(),
                _emailController.text.trim(),
                _passwordController.text.trim(),
              );
            },
          ),
          CustomTextButton(
            text: '로그인 페이지로 이동',
            click: () {
              // 계속 스택에 쌓여서 뒤로 가기 계속 해야 함
              // Navigator.pushNamed(context, '/login');
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => LoginPage()),
              );
            },
          )
        ],
      ),
    );
  }
}
