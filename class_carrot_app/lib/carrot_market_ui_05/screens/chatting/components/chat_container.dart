import 'package:class_carrot_app/carrot_market_ui_01/theme.dart';
import 'package:class_carrot_app/carrot_market_ui_04/screens/home/components/product_item.dart';
import 'package:class_carrot_app/carrot_market_ui_05/models/chat_message.dart';
import 'package:class_carrot_app/carrot_market_ui_05/screens/components/image_container.dart';
import 'package:flutter/material.dart';

class ChatContainer extends StatelessWidget {
  const ChatContainer({required this.chatMessage, super.key});

  final ChatMessage chatMessage;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(color: Colors.grey, width: 0.5),
        ),
      ),
      child: Expanded(
        child: Row(
          children: [
            ImageContainer(
              borderRadius: 25,
              imageUrl: chatMessage.profileImage,
              height: 50,
              width: 50,
            ),
            const SizedBox(width: 15),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        '${chatMessage.sender}',
                        style: textTheme().bodyLarge,
                      ),
                      const SizedBox(width: 3),
                      Text('${chatMessage.location} · ${chatMessage.sendDate}'),
                    ],
                  ),
                  Text(
                    '${chatMessage.message}',
                    style: TextStyle(color: Colors.black),
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
