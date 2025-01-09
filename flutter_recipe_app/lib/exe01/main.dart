import 'package:flutter/material.dart';
import 'package:flutter_recipe_app/main.dart';


void main() {
  runApp(MyApp());
}

class MyAppp extends StatelessWidget {
  MyAppp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(fontFamily: 'PatuaOne'),
      home: RecipePage(),
    );
  }
}

class RecipePage extends StatelessWidget {
  const RecipePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ,
      body: Co,
    );
  }
}

