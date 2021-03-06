import 'package:flutter/material.dart';
import 'package:whatsapp/screens/callfeed.dart';
import 'package:whatsapp/screens/chatfeed.dart';
import 'package:whatsapp/screens/statusfeed.dart';
import 'package:whatsapp/utilities/constants.dart';
import 'package:whatsapp/utilities/firebase/chatroomStream.dart';
import 'package:whatsapp/utilities/firebase/senddata.dart';
import 'package:whatsapp/widgets/common_bar.dart';
import 'package:flutter_contacts/contact.dart';
import 'package:flutter_contacts/flutter_contacts.dart';


class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);
  static const String id = 'home';
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {



  @override
  Widget build(BuildContext context) {
    return Material(
      color: kThemecolor,
      child: SafeArea(
          child: DefaultTabController(
            length: 3,
            child: Scaffold(
              appBar: PreferredSize(
                  preferredSize:  Size.fromHeight(
                      MediaQuery.of(context).size.height *2/ kTabSize
                  ),
                  child: const CommonBar(),
              ),
              body: const TabBarView(
                children: [
                  ChatFeed(),
                  StatusFeed(),
                  CallFeed(),
                ],

              ),
            ),
          )
      ),
    );
  }
}
