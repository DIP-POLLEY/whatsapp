// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:chatbox/chatbox.dart';
import 'package:flutter/material.dart';

import '../utilities/constants.dart';
import '../widgets/chat_commonbar.dart';

class ChatScreen extends StatefulWidget {
  static const String id = 'chat';
  const ChatScreen({Key? key}) : super(key: key);

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  @override
  Widget build(BuildContext context) {
    return Material(
      color: kThemecolor,
      child: SafeArea(
        child: Scaffold(
          backgroundColor: Color(0xffeee5de),
          appBar: PreferredSize(
            preferredSize:  Size.fromHeight(
                MediaQuery.of(context).size.height *1.1/ kTabSize
            ),
            child: const ChatCommonBar(),
          ),
          body: ListView(

            children: [
              ChatBox(
                message: "Hi",
                  recieved: true,
                  chatBoxColor: Colors.white,

              ),
              ChatBox(
                message: "Hi",
                recieved: false,
                chatBoxColor: Color(0xffd1edb7),

              ),
              ChatBox(
                message: "Now we can share images also",
                imageURL: "https://picsum.photos/250?image=9",
                recieved: false,
                chatBoxColor: Color(0xffd1edb7),

              ),
              ChatBox(
                message: "Yes Gifs are supported now",
                imageURL:"https://docs.flutter.dev/assets/images/dash/dash-fainting.gif",
                recieved: true,
                chatBoxColor: Colors.white,
              ),
              ChatBox(
                message: "https://pub.dev/packages/chatbox",
                recieved: false,
                chatBoxColor: Color(0xffd1edb7),

              ),
            ],
          ),
        ),
      ),
    );
  }
}
