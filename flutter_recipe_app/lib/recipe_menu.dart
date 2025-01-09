import 'package:flutter/material.dart';

class RecipeMenu extends StatelessWidget {
  const RecipeMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _buildMenuIcon(Icons.food_bank, 'ALL'),
          SizedBox(width: 25),
          _buildMenuIcon(Icons.emoji_food_beverage, 'Coffee'),
          SizedBox(width: 25),
          _buildMenuIcon(Icons.fastfood, 'Burger'),
          SizedBox(width: 25),
          _buildMenuIcon(Icons.local_pizza, 'Pizza'),
        ],
      ),
    );
  }

  // 메서드 만들어 보기
  // Container 위젯을 꾸며주고 싶다면
  Widget _buildMenuIcon(IconData mIcon, String text) {
    // container 위젯에 color 속성과 decoration 속성을 함께 쓰면 무조건 오류
    // 둘 중의 하나만 사용해야 함
    return Container(
      width: 60,
      height: 80,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black12),
        borderRadius: BorderRadius.circular(25),
      ),
      child: Column(
        mainAxisAlignment:
            MainAxisAlignment.center, //위에서부터 시작, 밑에서부터 시작이면 end 가운데면 center
        children: [
          Icon(mIcon, color: Colors.red),
          SizedBox(
            height: 5,
          ),
          Text(
            text,
            style: TextStyle(color: Colors.black54),
          )
        ],
      ),
    );
  }
}
