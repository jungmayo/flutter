import 'package:class_f_story/_core/utils/logger.dart';
import 'package:class_f_story/main.dart';
import 'package:flutter/material.dart';

class ExceptionHandler {
  static void handleException(dynamic exception, StackTrace stackTrace) {
    logger.e('Exception : $exception');
    logger.e('Exception : $stackTrace');

    // 간혹 비동기 작업시 currentContext가 사라질 수 있다.
    final mContext = navigatorkey.currentContext;
    if (mContext == null) return;

    ScaffoldMessenger.of(mContext).showSnackBar(
      SnackBar(
        content: Text(
          exception.toString(),
        ),
      ),
    );
  }
}
