import 'package:flutter/material.dart';
import 'package:whatsapp/utilities/constants.dart';
import 'package:whatsapp/widgets/mystatuscard.dart';
import 'package:whatsapp/widgets/statusfeedcard.dart';

class StatusFeed extends StatefulWidget {
  const StatusFeed({Key? key}) : super(key: key);

  @override
  State<StatusFeed> createState() => _StatusFeedState();
}

class _StatusFeedState extends State<StatusFeed> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomRight,
      children: [
        ListView(
          children: [
            Mystatuscard(),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Text(
                  "Recent updates"
              ),
            ),
            Statusfeedcard(),
            Statusfeedcard(),
            Statusfeedcard(),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Text(
                  "Viewed updates"
              ),
            ),
            Statusfeedcard(),
            Statusfeedcard(),
            Statusfeedcard(),
            Statusfeedcard(),


          ],
        ),
        Positioned(
          bottom: MediaQuery.of(context).size.height/10,
          right: MediaQuery.of(context).size.width/15,
          child: GestureDetector(
            child: Container(
              width: 45,
              height: 45,
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(50),
                boxShadow: [
                  BoxShadow(
                       color: Colors.black45,
                         offset: Offset.fromDirection(1),
                         blurRadius: 0.5,
                         spreadRadius: 0.1
                  )
                ]

              ),
              child: Icon(
                Icons.edit,
                color: Colors.black54,
              ),
            ),
            onTap: (){

            },
          )
        ),
        Positioned(
          bottom: MediaQuery.of(context).size.height/50,
          right: MediaQuery.of(context).size.width/19,
          child: GestureDetector(
            child: Container(
              width: 55,
              height: 55,
              decoration: BoxDecoration(
                  color: kThemecolor,
                  borderRadius: BorderRadius.circular(50),
                  boxShadow: [
                    BoxShadow(
                        color: Colors.black45,
                        offset: Offset.fromDirection(1),
                        blurRadius: 0.5,
                        spreadRadius: 0.1
                    )
                  ]

              ),
              child: Icon(
                Icons.camera_alt,
                color: Colors.white,
              ),
            ),
            onTap: (){

            },
          )
        )
      ],
    );
  }
}
