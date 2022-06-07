import 'package:flutter/material.dart';
import 'package:whatsapp/utilities/constants.dart';

class ChatFeedCard extends StatelessWidget {
  final bool unread;
  final bool mute;
   ChatFeedCard({
     this.unread=false,
     this.mute=false
  }) ;



  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      height: MediaQuery.of(context).size.height *1.75 / kTabSize,
      child: Row(
        children: [
          Expanded(
            flex: 2,
              child: Padding(
              padding: const EdgeInsets.only(left: 15),
              child: CircleAvatar(
                radius: 22,
                backgroundImage: AssetImage("assets/img.png"),
              ),
            )
          ),

          Expanded(
            flex: 6,
              child: Padding(
                padding: const EdgeInsets.only(left:10,top: 15 ),
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
              )
          ),


          Expanded(
            flex: 2,
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: Text(
                      "8:48 pm"
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 10.0,top: 10),
                  child: Row(
                    children: [

                      mute==true?Icon(
                          Icons.volume_mute_outlined,
                      ):Text("       "),
                      unread==true?
                      Container(
                        height: 20,
                          width: 20,
                          decoration: BoxDecoration(
                             color: Colors.greenAccent,
                              borderRadius: BorderRadius.all(Radius.circular(20))
                          ),
                          child: Text(
                            "3",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.white
                            ),
                          ),
                      ):Text(""),
                    ],
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
