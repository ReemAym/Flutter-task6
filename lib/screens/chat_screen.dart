import 'package:chat_app/constant.dart';
import 'package:chat_app/models/message.dart';
import 'package:chat_app/widgets/chat_bubble_for_friends.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../widgets/chat_bubble.dart';

class ChatScreen extends StatelessWidget {
  // const ChatScreen({super.key});

  CollectionReference messages =
      FirebaseFirestore.instance.collection(KMessageCollection);

  TextEditingController msg_controller = TextEditingController();
  static String id = 'Chat Screen';

  final scroll_controller = ScrollController();
  @override
  Widget build(BuildContext context) {
    var email = ModalRoute.of(context)!.settings.arguments;
    return StreamBuilder<QuerySnapshot>(
      stream: messages.orderBy(KCreatedAt, descending: true).snapshots(),
      builder: (context, snapshot) {
        print(snapshot.data);
        if (snapshot.hasData) {
          List<Message> messagesList = [];
          for (int i = 0; i < snapshot.data!.docs.length; i++) {
            messagesList.add(Message.fromJson(snapshot.data!.docs[i]));
          }
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
                  child: ListView.builder(
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
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(16),
                  child: TextField(
                    controller: msg_controller,
                    onSubmitted: (data) {
                      messages.add({
                        KMessage: data,
                        KCreatedAt: DateTime.now(),
                        KId: email,
                      });
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
                          messages.add({
                            KMessage: msg_controller.text,
                            KCreatedAt: DateTime.now(),
                            KId: email,
                          });
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
        } else {
          return Text('Loading');
        }
      },
    );
  }
}
