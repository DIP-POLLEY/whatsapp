import 'package:flutter/material.dart';
import 'package:whatsapp/screens/camerascreen.dart';
import 'package:whatsapp/widgets/chatfeedcard.dart';

class ChatFeed extends StatefulWidget {
  const ChatFeed({Key? key}) : super(key: key);

  @override
  State<ChatFeed> createState() => _ChatFeedState();
}

class _ChatFeedState extends State<ChatFeed> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(

      onPanUpdate: (details){
        // Swiping in right direction.
        if (details.delta.dx > 0) {
          print(details);
          Navigator.pushNamed(
          context, CameraScreen.id
          );

        }
      },
      child: ListView(
        children: const [
                ChatFeedCard(),
                ChatFeedCard(),
                ChatFeedCard(),
                ChatFeedCard(),
                ChatFeedCard(),
                ChatFeedCard(),
                ChatFeedCard(),
                ChatFeedCard(),

        ],
      ),
    );
  }
}

