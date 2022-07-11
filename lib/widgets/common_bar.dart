import 'package:flutter/material.dart';
import 'package:whatsapp/utilities/constants.dart';
import 'package:whatsapp/utilities/firebase/senddata.dart';

import '../screens/profile.dart';
import '../screens/welcomescreen.dart';

class CommonBar extends StatelessWidget {
  const CommonBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: const Text(
        'WhatsApp'
      ),
      backgroundColor: kThemecolor,
      bottom: TabBar(
        indicatorColor: Colors.white,
        indicatorWeight: 2.5,
        labelStyle: const TextStyle(
          fontWeight: FontWeight.w600,
        ),
        tabs: [

          Tab(

              text: 'CHATS',
              height: MediaQuery.of(context).size.height / kTabSize,
          ),
          Tab(
            text: 'STATUS',
            height: MediaQuery.of(context).size.height / kTabSize,
          ),
          Tab(
            text: 'CALLS',
            height: MediaQuery.of(context).size.height / kTabSize,
          )
        ],
      ),
      actions: [
        Padding(
            padding: const EdgeInsets.only(right: 20.0),
            child: GestureDetector(
              onTap: () {},
              child: const Icon(
                Icons.search,
                size: 26.0,
              ),
            )
        ),
        PopupMenuButton<int>(
          // ignore_for_file: prefer_const_constructors
          onSelected: (item) => onSelected(context,item),
            itemBuilder: (context)=>[
              PopupMenuItem(
                value: 0,
                child: Text("New group"),
            ),
              PopupMenuItem(
                value: 1,
                child: Text("New Broadcast"),
              ),
              PopupMenuItem(
                value: 2,
                child: Text("Linked devices"),
              ),
              PopupMenuItem(
                value: 3,
                child: Text("Starred messages"),
              ),
              PopupMenuItem(
                value: 4,
                child: Text("Payments"),
              ),
              PopupMenuItem(
                value: 5,
                child: Text("Settings"),
              ),
              PopupMenuItem(
                value: 6,
                child: Text("LogOut"),
              ),
              PopupMenuItem(
                value: 7,
                child: Text("Profile"),
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
      print("new group");
      break;
    case 1:
      print("new broadcast");
      break;
    case 2:
      print("Linked devices");
      break;
    case 3:
      print("Stared messages");
      break;

    case 4:
      print("Payments");
      break;

    case 5:
      print("Settings");
      break;

    case 6:
      Logout();
      Navigator.pushReplacementNamed(context, WelcomeScreen.id);
      break;
    case 7:
      Navigator.pushReplacementNamed(context, ProfileScreen.id);
      break;
  }
}

