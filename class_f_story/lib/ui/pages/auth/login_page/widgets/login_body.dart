import 'package:class_f_story/_core/constatants/size.dart';
import 'package:class_f_story/ui/widgets/custom_auth_text_form_field.dart';
import 'package:class_f_story/ui/widgets/custom_elevated_button.dart';
import 'package:class_f_story/ui/widgets/custom_logo.dart';
import 'package:class_f_story/ui/widgets/custom_text_button.dart';
import 'package:flutter/material.dart';

class LoginBody extends StatelessWidget {
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();

  LoginBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: ListView(
        children: [
          CustomLogo('f-story'),
          CustomAuthTextFormField(
            text: 'Username',
            controller: _usernameController,
          ),
          const SizedBox(height: largeGap),
          CustomAuthTextFormField(
            text: 'Password',
            controller: _passwordController,
          ),
          const SizedBox(height: largeGap),
          CustomElevatedButton(
            text: '로그인',
            click: () {
              String temp1 = _usernameController.text.trim();
              String temp2 = _passwordController.text.trim();
              // TODO - 로그인 처리
              // 뷰 모델에 있는 기능인 로그인 행위를 만들어 줄 예정
            },
          ),
          CustomTextButton(
            text: '회원가입 페이지로 이동',
            click: () {
              Navigator.pushNamed(context, '/join');
            },
          ),
        ],
      ),
    );
  }
}
