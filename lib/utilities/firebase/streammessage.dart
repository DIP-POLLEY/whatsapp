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
    if(_scrollController.hasClients)
    _scrollController.jumpTo(_scrollController.position.maxScrollExtent);
  }
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: _firestore.collection('chatroom').doc((int.parse(kUser)+int.parse(widget.colphn)).toString()).collection("chats").orderBy('timestamp', descending: false).snapshots(),
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
        String img = data["text"].toString();
        int len = img.length;
        // bool imgtxt = img.substring(0,1) == "£";
        Widget wgt;

        if(len>0)
          {
            if(img[0]=="£")
              {
                wgt = ChatBox(
                  recieved: !cond,
                  chatBoxColor: !cond?Colors.white:Color(0xffd1edb7),
                  imageURL: img.substring(1,len),
                );
              }
            else
              {
                wgt = ChatBox(
                  recieved: !cond,
                  chatBoxColor: !cond?Colors.white:Color(0xffd1edb7),
                  message: data["text"],
                );
              }
          }
        else
          {
            wgt = ChatBox(
              recieved: !cond,
              chatBoxColor: !cond?Colors.white:Color(0xffd1edb7),
              message: data["text"],
            );
          }


        return wgt;



        }
        ).toList(),
        );


      },
    );
  }
}


// WidgetsBinding.instance.addPostFrameCallback((_) => _scrollToBottom());
// return ListView(
// controller: _scrollController,
// children: snapshot.data!.docs.map((DocumentSnapshot document) {
// Map<String, dynamic> data = document.data()! as Map<String, dynamic>;
//
// bool cond = data["sender"]==kUser;
// String img = data["text"].toString();
// // int len = img.length;
// // bool imgtxt = img.substring(0,1) == "£";
// // Widget? wgt;
//
//
// return ChatBox(
// recieved: !cond,
// chatBoxColor: !cond?Colors.white:Color(0xffd1edb7),
// message: data["text"],
// );
//
//
//
// }
// ).toList(),
// );




//
// List<ChatBox> chatcard = [];
// var details = snapshot.data!.docs;
// for(var detl in details){
// var  data = detl.data()! as Map<String, dynamic>;
// bool cond = data["sender"]==kUser;
// String img = data["text"].toString();
// int len = img.length;
// final wgt;
// len>0?print(img[0]):print("00000");
//
// if(len>0)
// {
// if(img[0]=="")
// {
// wgt=ChatBox(
// recieved: !cond,
// chatBoxColor: !cond?Colors.white:Color(0xffd1edb7),
// message: img.substring(1,len),
// );
// }
// else
// {
// wgt=ChatBox(
// recieved: !cond,
// chatBoxColor: !cond?Colors.white:Color(0xffd1edb7),
// message: data["text"],
// );
// }
// }
// else
// {
// wgt=ChatBox(
// recieved: !cond,
// chatBoxColor: !cond?Colors.white:Color(0xffd1edb7),
// message: data["text"],
// );
// }
// chatcard.add(wgt);
//
// }












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