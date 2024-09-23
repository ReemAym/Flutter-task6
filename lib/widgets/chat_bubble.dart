import 'package:chat_app/models/message.dart';
import 'package:flutter/material.dart';

import '../constant.dart';

class ChatBubble extends StatelessWidget {
  const ChatBubble({
    super.key,
    required this.msg,
  });
  final Message msg;
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Container(
        // alignment: Alignment.centerLeft,
        margin: EdgeInsets.all(8),
        padding: EdgeInsets.all(16),
        decoration: BoxDecoration(
            color: KPrimaryColor,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
              bottomRight: Radius.circular(20),
            )),

        child: Text(
          msg.message,
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
