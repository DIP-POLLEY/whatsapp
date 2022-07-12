// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'dart:io';

import 'package:chatbox/chatbox.dart';
import 'package:emoji_picker_flutter/emoji_picker_flutter.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:whatsapp/screens/sendimage.dart';
import 'package:whatsapp/utilities/firebase/senddata.dart';
import 'package:whatsapp/utilities/firebase/streammessage.dart';
import 'package:whatsapp/widgets/attachments.dart';
import '../utilities/constants.dart';
import '../utilities/firebase/uploadfiles.dart';
import '../widgets/chat_commonbar.dart';

class ChatScreen extends StatefulWidget {
  static const String id = 'chat';
  final String ph1;
  final String senderphn;
  ChatScreen({required this.ph1,required this.senderphn});


  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final TextEditingController _controller = TextEditingController();
  bool emojiShowing = false;
  bool mic = true;
  bool keyboard = false;
  bool attachment = false;

  _onEmojiSelected(Emoji emoji) {
    _controller
      ..text += emoji.emoji
      ..selection = TextSelection.fromPosition(
          TextPosition(offset: _controller.text.length));
  }

  _onBackspacePressed() {
    _controller
      ..text = _controller.text.characters.skipLast(1).toString()
      ..selection = TextSelection.fromPosition(
          TextPosition(offset: _controller.text.length));
  }

  File? image;

  Future pickImage(ImageSource source) async
  {
    try{
      final img  = await ImagePicker().pickImage(source: source);
      if(img == null) return;

      final imageTemp = File(img.path);
      this.image = imageTemp;
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (_) => Sendimage(
            image: image,
            senderphn: widget.senderphn,
          ),
        ),
      );

    }on PlatformException catch (e){
      print(e);
    }

  }

  Future pickfile() async
  {
    try{
      final result = await FilePicker.platform.pickFiles();
      if(result.toString() == "") return;

      final fileTemp = result?.files.first;
      //print(fileTemp?.name);
      UploadFilesFirebase(fileTemp,widget.senderphn,(fileTemp?.name).toString());


    }on PlatformException catch (e){
      print(e);
    }

  }




  @override
  Widget build(BuildContext context) {
    return Material(
      color: kThemecolor,
      child: SafeArea(
        child: Scaffold(
          backgroundColor: Color(0xffeee5de),
          appBar: PreferredSize(
            preferredSize:  Size.fromHeight(
                MediaQuery.of(context).size.height *1.1/ kTabSize
            ),
            child: ChatCommonBar(chatName: widget.ph1),
          ),
          body: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Flexible(
                flex: 9,
                  child: MessagesStream(
                      colphn: widget.senderphn,
                  ),

              ),
              SizedBox(
                height: 5,
              ),

              Flexible(
                flex: 1,
                child: Container(
                  height: (MediaQuery.of(context).size.height/15).toDouble(),
                  color: Colors.transparent,
                  child: Row(
                    children: [
                      Flexible(
                        flex: 9,
                          child: Padding(
                            padding: const EdgeInsets.only(left: 5,right: 5),
                            child: Container(

                              decoration: BoxDecoration(
                                color: Colors.white,
                                  borderRadius: BorderRadius.all(Radius.circular(40))
                              ),
                              child: Row(
                                children: [
                                  Flexible(
                                      child: Padding(
                                        padding: const EdgeInsets.only(left: 5),
                                        child: GestureDetector(
                                          onTap: (){
                                            setState(() {
                                              FocusScopeNode currentFocus = FocusScope.of(context);
                                              if (!currentFocus.hasPrimaryFocus) {
                                                currentFocus.unfocus();
                                              }
                                              emojiShowing = !emojiShowing;
                                              keyboard = !emojiShowing?true:false;
                                              // print(keyboard);
//                                              _controller.clear();
                                            });

                                          },
                                          child: !emojiShowing?Icon(
                                            Icons.emoji_emotions_outlined
                                          ):Icon(Icons.keyboard),
                                        ),
                                      )
                                  ),
                                  Flexible(

                                      child: Padding(
                                        padding: const EdgeInsets.only(left: 10),
                                        child: TextField(
                                          autofocus: keyboard,
                                          controller: _controller,
                                          cursorColor: kThemecolor,
                                          decoration: InputDecoration(
                                            hintText: "Message",
                                            border: InputBorder.none
                                          ),
                                          onChanged: (val){
                                            if(val.isNotEmpty)
                                              {
                                                setState(() {
                                                  mic = false;
                                                });

                                              }
                                            else
                                              {
                                                setState(() {
                                                  mic = true;
                                                });
                                              }
                                          },
                                        ),
                                      ),
                                    flex: 8,
                                  ),
                                  Flexible(
                                    flex: 1,
                                      child: GestureDetector(
                                        onTap: (){
                                          setState(() {
                                            attachment = !attachment;
                                          });
                                        },
                                        child: Icon(
                                          Icons.attach_file_sharp,
                                        ),
                                      )
                                  )
                                ],
                              ),
                            ),
                          )
                      ),
                      Flexible(
                        flex: 1,
                        child: ElevatedButton(
                          style: ButtonStyle(
                            padding: MaterialStateProperty.all(EdgeInsets.all(0)),
                            backgroundColor: MaterialStateProperty.all(kThemecolor),
                              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(50.0),
                                      side: BorderSide(color: kThemecolor)
                                  )
                              )
                          ),
                          onPressed: (){
                            print(_controller.text);
                            adddata(_controller.text, widget.senderphn);
                            _controller.clear();
                            setState(() {});

                          },
                          child: mic?Icon(
                            Icons.mic
                          ):
                          Icon(
                             Icons.send,
                          ),

                        ),
                      )

                    ],
                  ),
                ),
              ),
              Offstage(
                offstage: !emojiShowing,
                child: SizedBox(
                  height: 250,
                  child: EmojiPicker(
                      onEmojiSelected: (Category category, Emoji emoji) {
                        _onEmojiSelected(emoji);
                      },
                      onBackspacePressed: _onBackspacePressed,
                      config: Config(
                          columns: 7,
                          // Issue: https://github.com/flutter/flutter/issues/28894
                          emojiSizeMax: 32 ,
                          verticalSpacing: 0,
                          horizontalSpacing: 0,
                          gridPadding: EdgeInsets.zero,
                          initCategory: Category.RECENT,
                          bgColor: const Color(0xFFF2F2F2),
                          indicatorColor: Colors.blue,
                          iconColor: Colors.grey,
                          iconColorSelected: Colors.blue,
                          progressIndicatorColor: Colors.blue,
                          backspaceColor: Colors.blue,
                          skinToneDialogBgColor: Colors.white,
                          skinToneIndicatorColor: Colors.grey,
                          enableSkinTones: true,
                          showRecentsTab: true,
                          recentsLimit: 28,
                          replaceEmojiOnLimitExceed: false,
                          noRecents: const Text(
                            'No Recents',
                            style: TextStyle(fontSize: 20, color: Colors.black26),
                            textAlign: TextAlign.center,
                          ),
                          tabIndicatorAnimDuration: kTabScrollDuration,
                          categoryIcons: const CategoryIcons(),
                          buttonMode: ButtonMode.MATERIAL)),
                ),
              ),
              Offstage(
                offstage: !attachment,
                child: Padding(
                  padding: const EdgeInsets.only(top: 2),
                  child: Container(
                    color: Colors.white,
                    height: MediaQuery.of(context).size.height /4,
                    child: Column(
                      children: [
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          children: [
                            
                            Expanded(
                              flex: 1,
                              child: AttachButton(
                                name: "Document",
                                clr: Colors.indigo,
                                icn: Icons.insert_drive_file_sharp,
                                onpres: (){
                                  pickfile();
                                },
                              ),
                            ),
                            Expanded(
                              flex: 1,
                              child: AttachButton(
                                name: "Camera",
                                clr: Colors.pinkAccent,
                                icn: Icons.camera_alt,
                                onpres: (){
                                  pickImage(ImageSource.camera);
                                },
                              ),
                            ),
                            Expanded(
                              flex: 1,
                              child: AttachButton(
                                name: "Gallery",
                                clr: Colors.purpleAccent,
                                icn: Icons.image,
                                onpres: (){
                                  pickImage(ImageSource.gallery);
                                },
                              ),
                            )

                          ],
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          children: [

                            Expanded(
                              flex: 1,
                              child: AttachButton(
                                name: "Audio",
                                clr: Colors.amber,
                                icn: Icons.headphones,
                                onpres: (){},
                              ),
                            ),
                            Expanded(
                              flex: 1,
                              child: AttachButton(
                                name: "Location",
                                clr: Colors.green,
                                icn: Icons.location_on,
                                onpres: (){},
                              ),
                            ),
                            Expanded(
                              flex: 1,
                              child: AttachButton(
                                name: "Contact",
                                clr: Colors.cyan,
                                icn: Icons.person,
                                onpres: (){},
                              ),
                            )

                          ],
                        )
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}






