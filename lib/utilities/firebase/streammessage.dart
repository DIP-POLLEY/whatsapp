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
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: _firestore.collection('users').doc("+917003814954").collection(widget.colphn).orderBy('timestamp', descending: false).snapshots(),
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (!snapshot.hasData) {
          return Center(
            child: CircularProgressIndicator(
              backgroundColor: Colors.lightBlueAccent,
            ),
          );
        }
        return ListView(
        children: snapshot.data!.docs.map((DocumentSnapshot document) {
          Map<String, dynamic> data = document.data()! as Map<String, dynamic>;
          bool cond = data["sender"]=="+917003814954";

          return ChatBox(
              recieved: !cond,
              chatBoxColor: !cond?Colors.white:Color(0xffd1edb7),
              message: data["text"],
          );

        }).toList(),
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