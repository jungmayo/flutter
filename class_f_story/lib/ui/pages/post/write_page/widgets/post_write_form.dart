import 'package:class_f_story/_core/constatants/size.dart';
import 'package:class_f_story/data/_vm/post_write_view_model.dart';
import 'package:class_f_story/ui/widgets/custom_elevated_button.dart';
import 'package:class_f_story/ui/widgets/custom_text_area.dart';
import 'package:class_f_story/ui/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class PostWriteForm extends ConsumerWidget {
  // 폼의 상태, 유효성 검사 -- save() 호출이라던지..

  // 런타임 시점에서 실행되기 때문에 컴파일 안됨 => const 지워야됨
  final _formKey = GlobalKey<FormState>();
  final _titleController = TextEditingController();
  final _contentController = TextEditingController();

  PostWriteForm({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    //post_write_view_model 만드는게 핵심

    // 뷰 모델 상태를 구독
    // 뷰 모델 행위를 사용해야 한다.
    // (레코드 타입) // (title,content,isWriteCompleted)
    final data = ref.watch(postWriteViewModelProvider);

    // 뷰 모델 자체를 들고옴
    final vm = ref.read(postWriteViewModelProvider.notifier);

    return Form(
      key: _formKey,
      child: ListView(
        shrinkWrap: true,
        children: [
          CustomTextFormField(
            hint: 'title',
            controller: _titleController,
          ),
          const SizedBox(height: smallGap),
          CustomTextArea(
            hint: 'content',
            controller: _contentController,
          ),
          const SizedBox(height: largeGap),
          CustomElevatedButton(
            text: '글쓰기',
            click: () {
              vm.createPost(
                title: _titleController.text.trim(),
                content: _contentController.text.trim(),
              );
              // if(data.$3 == true){
              //   // 페이지 이동 처리
              //   _titleController.text.clear();
              //   _contentController.text.clear();
              // }
            },
          )
        ],
      ),
    );
  }
}
