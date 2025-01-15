import 'package:class_carrot_app/carrot_market_ui_05/models/chat_message.dart';
import 'package:class_carrot_app/carrot_market_ui_05/screens/chatting/components/chat_container.dart';
import 'package:class_carrot_app/carrot_market_ui_05/screens/components/appbar_preferred_size.dart';
import 'package:flutter/material.dart';

class ChattingPage extends StatelessWidget {
  const ChattingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Row(
          children: [
            Text('채팅'),
          ],
        ),
        bottom: appBarBottomLine(),
      ),
      body: ListView.builder(
        itemBuilder: (BuildContext context, int index) {
          return ChatContainer(chatMessage: chatMessageList[index]);
        },
        itemCount: chatMessageList.length,
      ),
    );
  }
}
