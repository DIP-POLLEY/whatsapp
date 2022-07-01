

import 'package:flutter/material.dart';
import 'package:whatsapp/screens/camerascreen.dart';
import 'package:whatsapp/utilities/firebase/chatroomStream.dart';
import 'package:whatsapp/widgets/chatfeedcard.dart';

class ChatFeed extends StatefulWidget {
  const ChatFeed({Key? key}) : super(key: key);

  @override
  State<ChatFeed> createState() => _ChatFeedState();
}

class _ChatFeedState extends State<ChatFeed> {

  // final ImagePicker _picker = ImagePicker();
  // bool _isloading=false;
  // File _image = new File([],'assets/img.png');
  //
  // Future getImageCamera() async {
  //   final pickedFile = await _picker.getImage(source: ImageSource.camera);
  //
  //   setState(() {
  //     if (pickedFile != null) {
  //       _isloading=true;
  //       _image = File([],pickedFile.path);
  //     } else {
  //       print('No image selected.');
  //     }
  //   });
  // }


  @override
  Widget build(BuildContext context) {
    return GestureDetector(

      onPanUpdate: (details){
        // Swiping in right direction.
        if (details.delta.dx > 0) {
          // ignore_for_file: avoid_print
          print(details);
          Navigator.pushNamed(
          context, CameraScreen.id
          );
          // getImageCamera();
        }
      },
      child: getChatgroup(),
    );
  }
}

