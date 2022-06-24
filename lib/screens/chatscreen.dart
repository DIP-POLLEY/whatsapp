// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

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
    return SafeArea(
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize:  Size.fromHeight(
              MediaQuery.of(context).size.height *1.1/ kTabSize
          ),
          child: const ChatCommonBar(),
        ),
        body: Column(
          children: [
            Text(
              "hi",
            ),
          ],
        ),
      ),
    );
  }
}
