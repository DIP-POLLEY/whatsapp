import 'package:flutter/material.dart';
import 'package:whatsapp/utilities/constants.dart';
import 'package:whatsapp/widgets/mystatuscard.dart';
import 'package:whatsapp/widgets/statusfeedcard.dart';

import '../utilities/firebase/getstatus.dart';

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
          // ignore_for_file: prefer_const_constructors
          // ignore: prefer_const_literals_to_create_immutables
          children: [
            Mystatuscard(),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Text(
                  "Recent updates"
              ),
            ),
            getStatusgroup(),

            // Padding(
            //   padding: const EdgeInsets.all(12.0),
            //   child: Text(
            //       "Viewed updates"
            //   ),
            // ),
            // Statusfeedcard(),
            // Statusfeedcard(),
            // Statusfeedcard(),
            // Statusfeedcard(),


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
