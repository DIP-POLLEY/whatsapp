import 'package:flutter/material.dart';
import 'package:whatsapp/screens/statusview.dart';
import 'package:whatsapp/utilities/constants.dart';


class Statusfeedcard extends StatefulWidget {

  const Statusfeedcard({Key? key, required this.name, required this.statuslink}) : super(key: key);
  final String name;
  final String statuslink;
  @override
  State<Statusfeedcard> createState() => _StatusfeedcardState();
}

class _StatusfeedcardState extends State<Statusfeedcard> {


  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ()
      {
          Navigator.push(context,
          MaterialPageRoute(builder: (context) => Statusview(statuslink: widget.statuslink,))
          );
      },
      child: Container(
        color: Colors.white,
        height: MediaQuery.of(context).size.height *1.5 / kTabSize,
        child: Row(
          // ignore_for_file: prefer_const_constructors
          children: [
            Expanded(
                flex: 2,
                child: Padding(
                  padding: const EdgeInsets.only(left: 15),
                  child: CircleAvatar(
                    radius: 22,
                    backgroundImage: NetworkImage(widget.statuslink),
                  ),
                )
            ),

            Expanded(
                flex: 8,
                child: Padding(
                  padding: const EdgeInsets.only(left:10,top: 12 ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding:  EdgeInsets.all(4.0),
                        child: Text(
                          widget.name,
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 18
                          ),
                        ),
                      ),
                      Padding(
                        padding:  EdgeInsets.all(4.0),
                        child: Text(
                          "Yesterday, 5:78 pm",
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



          ],
        ),
      ),
    );
  }
}

