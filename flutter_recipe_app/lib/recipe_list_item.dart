import 'package:flutter/material.dart';

class RecipeListItem extends StatelessWidget {
  final String imageName;
  final String title;
  // 하드 코딩
  const RecipeListItem(this.imageName, this.title, {super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AspectRatio(
            aspectRatio: 2 / 1,
            // 해당 위젯으로 이미지 라운드 처리 쉽게
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Image.asset(
                'assets/images/${imageName}.jpeg',
                fit: BoxFit.cover,
              ),
            ),
          ),
          SizedBox(height: 10),
          Text(title, style: TextStyle(fontSize: 20)),
          Text('Have Your ...............')
          //이미지
          //텍스트1
          //텍스트2
        ],
      ),
    );
  }
}
