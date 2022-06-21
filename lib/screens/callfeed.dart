import 'package:flutter/material.dart';
import 'package:whatsapp/widgets/callfeedcard.dart';

class CallFeed extends StatefulWidget {
  const CallFeed({Key? key}) : super(key: key);

  @override
  State<CallFeed> createState() => _CallFeedState();
}

class _CallFeedState extends State<CallFeed> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      // ignore_for_file: prefer_const_constructors
      // ignore: prefer_const_literals_to_create_immutables
      children: [
        CallFeedCard(
          connctd: false,
          calling: false,
        ),
        CallFeedCard(
          calling: false,
        ),
        CallFeedCard(

        ),
        CallFeedCard(),
        CallFeedCard(
          vid: true,
        ),
        CallFeedCard(),
        CallFeedCard(),
        CallFeedCard(),
        CallFeedCard(),
        CallFeedCard(),
        CallFeedCard(),
        CallFeedCard(),



      ],
    );
  }
}
