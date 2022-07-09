
import 'dart:io';

import 'package:emoji_picker_flutter/emoji_picker_flutter.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../utilities/constants.dart';
import '../utilities/firebase/senddata.dart';
import '../utilities/firebase/uploadfiles.dart';

class Sendimage extends StatefulWidget {
  final File? image;
  final String senderphn;

  const Sendimage({Key? key,required this.image, required this.senderphn}) : super(key: key);

  @override
  State<Sendimage> createState() => _SendimageState();
}

class _SendimageState extends State<Sendimage> {
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
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black45,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [

              Expanded(
                flex: 9,
                child: Container(
                  child: widget.image!=null?Image.file(
                      widget.image!,
                    height: MediaQuery.of(context).size.height/2,
                    width: MediaQuery.of(context).size.width,
                    fit: BoxFit.cover,
                  ):Image.asset("assets/brand.png"),
                ),
              ),


             Expanded(
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

                                        },
                                      ),
                                    ),
                                    flex: 9,
                                  ),

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
                          onPressed: ()async{
                            //print(_controller.text);
                            await Uploadtofirebase(
                              widget.image,
                              widget.senderphn
                            );
                            Navigator.pop(context);

                            //adddata(_controller.text, widget.senderphn);
                            _controller.clear();


                          },
                          child: Icon(
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
          ],
        ),
      ),
    );
  }
}
