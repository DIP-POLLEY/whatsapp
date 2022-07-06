import 'package:chatbox/chatbox.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:whatsapp/utilities/constants.dart';

final _firestore = FirebaseFirestore.instance;


class MessagesStream extends StatefulWidget {
  MessagesStream({required this.colphn});
  final String colphn;

  @override
  State<MessagesStream> createState() => _MessagesStreamState();
}

class _MessagesStreamState extends State<MessagesStream> {
  ScrollController _scrollController = ScrollController();

  _scrollToBottom() {
    _scrollController.jumpTo(_scrollController.position.maxScrollExtent);
  }
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: _firestore.collection('chatroom').doc(kUser+widget.colphn).collection("chats").orderBy('timestamp', descending: false).snapshots(),
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (!snapshot.hasData) {
          return Center(
            child: CircularProgressIndicator(
              backgroundColor: Colors.lightBlueAccent,
            ),
          );
        }
        WidgetsBinding.instance.addPostFrameCallback((_) => _scrollToBottom());
        return ListView(
          controller: _scrollController,
        children: snapshot.data!.docs.map((DocumentSnapshot document) {
          Map<String, dynamic> data = document.data()! as Map<String, dynamic>;

          bool cond = data["sender"]==kUser;

          return ChatBox(
              recieved: !cond,
              chatBoxColor: !cond?Colors.white:Color(0xffd1edb7),
              message: data["text"],
          );

        }
        ).toList(),
        );


      },
    );
  }
}







// final messages = snapshot.data!.docs.reversed;
// List<ChatBox> messageBubbles = [];
// for (var message in messages) {
// final messageText = message["text"];
// final recv = message["sender"]=="+917003814954";
//

//
// final messageBubble = ChatBox(
// recieved: !recv,
// chatBoxColor: !recv?Colors.white:Color(0xffd1edb7),
// message: messageText,
// );
//
// messageBubbles.add(messageBubble);
// }
// return Expanded(
// child: ListView(
// reverse: true,
// padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 20.0),
// children: messageBubbles,
// ),
// );