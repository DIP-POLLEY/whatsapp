import 'package:flutter/material.dart';
import 'package:whatsapp/utilities/constants.dart';


class Statusfeedcard extends StatefulWidget {
  const Statusfeedcard({Key? key}) : super(key: key);

  @override
  State<Statusfeedcard> createState() => _StatusfeedcardState();
}

class _StatusfeedcardState extends State<Statusfeedcard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      height: MediaQuery.of(context).size.height *1.5 / kTabSize,
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
              flex: 8,
              child: Padding(
                padding: const EdgeInsets.only(left:10,top: 12 ),
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
    );
  }
}

