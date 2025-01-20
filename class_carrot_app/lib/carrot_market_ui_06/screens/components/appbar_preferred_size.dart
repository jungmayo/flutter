import 'package:flutter/material.dart';

appBarBottomLine() {
  var height = 0.5;
  return PreferredSize(
    preferredSize: Size.fromHeight(height),
    child: Divider(
      thickness: 0.5,
      height: height,
      color: Colors.grey,
    ),
  );
}
