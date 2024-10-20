import 'package:chat_app/screens/cubits/chat_cubit/chat_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../constant.dart';
import '../models/message.dart';
import '../widgets/chat_bubble_for_friends.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../widgets/chat_bubble.dart';

class ChatScreen extends StatelessWidget {
  // const ChatScreen({super.key});

  // CollectionReference messages =
  //     FirebaseFirestore.instance.collection(KMessageCollection);

  List<Message> messagesList = [];
  TextEditingController msg_controller = TextEditingController();
  static String id = 'Chat Screen';

  final scroll_controller = ScrollController();
  @override
  Widget build(BuildContext context) {
    String email = ModalRoute.of(context)!.settings.arguments.toString();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: KPrimaryColor,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              KLogo,
              height: 55,
            ),
            const Text(
              'Chat',
              style: TextStyle(color: Colors.white),
            ),
          ],
        ),
        automaticallyImplyLeading: false,
      ),
      body: Column(
        children: [
          Expanded(
            child: BlocConsumer<ChatCubit, ChatState>(
              listener: (context, state) {
                if (state is ChatSuccess) {
                  messagesList = state.messageList;
                }
              },
              builder: (context, state) {
                return ListView.builder(
                  reverse: true,
                  controller: scroll_controller,
                  itemCount: messagesList.length,
                  itemBuilder: (context, index) {
                    return messagesList[index].id == email
                        ? ChatBubble(
                            msg: messagesList[index],
                          )
                        : ChatBubbleForFriends(
                            msg: messagesList[index],
                          );
                  },
                );
              },
            ),
          ),
          Padding(
            padding: EdgeInsets.all(16),
            child: TextField(
              controller: msg_controller,
              onSubmitted: (data) {
                BlocProvider.of<ChatCubit>(context)
                    .sendMessage(message: data, email: email);

                // messages.add({
                //   KMessage: data,
                //   KCreatedAt: DateTime.now(),
                //   KId: email,
                // });
                msg_controller.clear();
                scroll_controller.animateTo(
                  0,
                  duration: Duration(milliseconds: 500),
                  curve: Curves.fastOutSlowIn,
                );
              },
              decoration: InputDecoration(
                hintText: 'Send Message',
                suffix: GestureDetector(
                  onTap: () {
                    BlocProvider.of<ChatCubit>(context).sendMessage(
                        message: msg_controller.text, email: email);
                    // messages.add({
                    //   KMessage: msg_controller.text,
                    //   KCreatedAt: DateTime.now(),
                    //   KId: email,
                    // });
                    msg_controller.clear();
                    scroll_controller.animateTo(
                      0,
                      duration: Duration(milliseconds: 500),
                      curve: Curves.fastOutSlowIn,
                    );
                  },
                  child: Icon(
                    Icons.send,
                    color: KPrimaryColor,
                  ),
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                  borderSide: BorderSide(color: KPrimaryColor),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
