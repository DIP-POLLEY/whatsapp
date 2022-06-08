import 'package:flutter/material.dart';
import 'package:whatsapp/utilities/constants.dart';


class CallFeedCard extends StatefulWidget {

  final bool vid;
  final bool connctd;
  final bool calling;

  const CallFeedCard({this.vid=false,this.connctd=true,this.calling=true}) ;




  @override
  State<CallFeedCard> createState() => _CallFeedCardState();
}

class _CallFeedCardState extends State<CallFeedCard> {

  bool _vid=false;
  bool _connctd=false;
  bool _calling=false;


  @override
  void initState() {
   _vid = widget.vid;
   _connctd = widget.connctd;
   _calling = widget.calling;
  }

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
                  children:  [
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
                      child: Row(
                        children: [
                          Icon(
                            _calling==true?Icons.call_made:Icons.call_received,
                            color: _connctd==true?Colors.greenAccent:Colors.redAccent,
                            size: 18,
                          ),
                          SizedBox(
                            width: 8,
                          ),
                          Text(
                            "6 June, 12:11 pm",
                            style: TextStyle(
                                fontWeight: FontWeight.w400,
                                fontSize: 15,
                                color: Colors.black45
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              )
          ),


          Expanded(
            flex: 2,
            child: Icon(
              _vid==false?Icons.call:Icons.videocam,
              color: kThemecolor,
            )
          )
        ],
      ),
    );
  }
}
