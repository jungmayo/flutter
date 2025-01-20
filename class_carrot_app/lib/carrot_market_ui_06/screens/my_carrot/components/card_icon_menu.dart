import 'package:class_carrot_app/carrot_market_ui_06/models/icon_menu.dart';
import 'package:flutter/material.dart';

class CardIconMenu extends StatelessWidget {
  final List<IconMenu> iconMenuList;
  const CardIconMenu({required this.iconMenuList, super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 1.5,
      margin: EdgeInsets.zero,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(0.0)),
      child: Column(
        children: List.generate(
          iconMenuList.length,
          (index) => _buildIconTextMenu(
              iconMenuList[index].iconData, iconMenuList[index].title),
        ),
      ),
    );
  }

  Widget _buildIconTextMenu(IconData mIcon, String title) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          Icon(mIcon),
          const SizedBox(width: 10),
          Text(
            title,
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.w500),
          )
        ],
      ),
    );
  }
}
