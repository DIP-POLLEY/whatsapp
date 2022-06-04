import 'package:flutter/material.dart';
import 'package:whatsapp/utilities/constants.dart';

class CommonBar extends StatelessWidget {
  const CommonBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(
        'WhatsApp'
      ),
      backgroundColor: Color(0xff00a783),
      bottom: TabBar(
        indicatorColor: Colors.white,
        indicatorWeight: 2.5,
        labelStyle: TextStyle(
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
            padding: EdgeInsets.only(right: 20.0),
            child: GestureDetector(
              onTap: () {},
              child: Icon(
                Icons.search,
                size: 26.0,
              ),
            )
        ),
        Padding(
            padding: EdgeInsets.only(right: 20.0),
            child: GestureDetector(
              onTap: () {

              },
              child: Icon(
                  Icons.more_vert
              ),
            )
        ),
      ],

    );
  }
}
