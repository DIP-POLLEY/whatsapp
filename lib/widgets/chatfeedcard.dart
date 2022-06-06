import 'package:flutter/material.dart';
import 'package:whatsapp/utilities/constants.dart';

class ChatFeedCard extends StatelessWidget {
  const ChatFeedCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      height: MediaQuery.of(context).size.height *1.75 / kTabSize,
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Padding(
              padding:  EdgeInsets.all(4.0),
              child: Text(
                "Contact Name",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18
                ),
              ),
            ),
            Padding(
              padding:  EdgeInsets.all(4.0),
              child: Text(
                "Last Chat",
                style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 15,
                    color: Colors.black45
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
