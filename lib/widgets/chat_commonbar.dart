// ignore_for_file: prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:whatsapp/utilities/constants.dart';

import '../screens/homepage.dart';

class ChatCommonBar extends StatelessWidget {
  final String chatName;
  final String img;
  ChatCommonBar({required this.chatName,required this.img});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leadingWidth: 25,
      leading: GestureDetector(
          child: Icon(Icons.arrow_back),
        onTap: ()
        {
          //Navigator.pop(context);
          Navigator.pushReplacementNamed(context, HomePage.id);
        },
      ),
      title: Row(
        children: [
          Padding(
            padding: EdgeInsets.only(right: 10),
            child: CircleAvatar(
              backgroundImage: NetworkImage(img),
            ),
          ),
          Text("$chatName"),
        ],
      ),
      backgroundColor: kThemecolor,
      actions: [
        Padding(
            padding: const EdgeInsets.only(right: 20.0),
            child: GestureDetector(
              onTap: () {},
              child: const Icon(
                Icons.videocam_rounded,
                size: 26.0,
              ),
            )
        ),
        Padding(
            padding: const EdgeInsets.only(right: 20.0),
            child: GestureDetector(
              onTap: () {},
              child: const Icon(
                Icons.call,
                size: 26.0,
              ),
            )
        ),
        PopupMenuButton<int>(
          // ignore_for_file: prefer_const_constructors
          //onSelected: (item) => onSelected(context,item),
          itemBuilder: (context)=>[
            PopupMenuItem(
              value: 0,
              child: Text("View contact"),
            ),
            PopupMenuItem(
              value: 1,
              child: Text("Media,links and docs"),
            ),
            PopupMenuItem(
              value: 2,
              child: Text("Search"),
            ),
            PopupMenuItem(
              value: 3,
              child: Text("Mute notifications"),
            ),
            PopupMenuItem(
              value: 4,
              child: Text("Disappearing messages"),
            ),
            PopupMenuItem(
              value: 5,
              child: Text("Wallpaper"),
            ),
          ],
        ),
      ],
    );
  }
}

void onSelected(BuildContext context,int item){
  // ignore_for_file: avoid_print
  switch(item){
    case 0:
      print("View contact");
      break;
    case 1:
      print("Media,links and docs");
      break;
    case 2:
      print("Search");
      break;
    case 3:
      print("Mute notifications");
      break;

    case 4:
      print("Disappearing messages");
      break;

    case 5:
      print("Wallpaper");
      break;

  }
}
