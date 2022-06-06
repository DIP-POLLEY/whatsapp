import 'package:flutter/material.dart';
import 'package:whatsapp/utilities/constants.dart';

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
        Padding(
            padding: const EdgeInsets.only(right: 20.0),
            child: GestureDetector(
              onTap: () {

              },
              child: const Icon(
                  Icons.more_vert
              ),
            )
        ),
      ],

    );
  }
}
