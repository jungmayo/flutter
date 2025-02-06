import 'package:class_f_story/ui/pages/post/write_page/widgets/post_write_form.dart';
import 'package:flutter/material.dart';

class PostWriteBody extends StatelessWidget {
  const PostWriteBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        // form은 기본적으로 Flexible 사용하자..!
        children: [
          Flexible(
            child: PostWriteForm(),
          ),
        ],
      ),
    );
  }
}
