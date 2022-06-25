// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:chatbox/chatbox.dart';
import 'package:emoji_picker_flutter/emoji_picker_flutter.dart';
import 'package:flutter/material.dart';

import '../utilities/constants.dart';
import '../widgets/chat_commonbar.dart';

class ChatScreen extends StatefulWidget {
  static const String id = 'chat';
  const ChatScreen({Key? key}) : super(key: key);

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final TextEditingController _controller = TextEditingController();
  bool emojiShowing = false;

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
            child: const ChatCommonBar(),
          ),
          body: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Flexible(
                flex: 9,
                  child: ListView(

                    children: [
                      ChatBox(
                        message: "Hi",
                        recieved: true,
                        chatBoxColor: Colors.white,

                      ),
                      ChatBox(
                        message: "Hi",
                        recieved: false,
                        chatBoxColor: Color(0xffd1edb7),

                      ),
                      ChatBox(
                        message: "Now we can share images also",
                        imageURL: "https://picsum.photos/250?image=9",
                        recieved: false,
                        chatBoxColor: Color(0xffd1edb7),

                      ),
                      ChatBox(
                        message: "Yes Gifs are supported now",
                        imageURL:"https://docs.flutter.dev/assets/images/dash/dash-fainting.gif",
                        recieved: true,
                        chatBoxColor: Colors.white,
                      ),
                      ChatBox(
                        message: "https://pub.dev/packages/chatbox",
                        recieved: false,
                        chatBoxColor: Color(0xffd1edb7),

                      ),
                    ],
                  ),
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
                                              emojiShowing = !emojiShowing;
                                            });
                                          },
                                          child: Icon(
                                            Icons.emoji_emotions_outlined
                                          ),
                                        ),
                                      )
                                  ),
                                  Flexible(

                                      child: Padding(
                                        padding: const EdgeInsets.only(left: 10),
                                        child: TextField(
                                          controller: _controller,
                                          cursorColor: kThemecolor,
                                          decoration: InputDecoration(
                                            hintText: "Message",
                                            border: InputBorder.none
                                          ),
                                        ),
                                      ),
                                    flex: 9,
                                  )
                                ],
                              ),
                            ),
                          )
                      ),
                      Flexible(
                        flex: 1,
                        child: ElevatedButton(

                          onPressed: (){

                          },
                          child: Icon(Icons.arrow_back),

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
            ],
          ),
        ),
      ),
    );
  }
}



