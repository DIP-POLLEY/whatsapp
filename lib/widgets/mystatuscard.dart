import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:whatsapp/utilities/constants.dart';

import '../screens/statusview.dart';
import '../utilities/constants.dart';
import '../utilities/constants.dart';
import '../utilities/firebase/senddata.dart';


class Mystatuscard extends StatefulWidget {
  const Mystatuscard({Key? key}) : super(key: key);

  @override
  State<Mystatuscard> createState() => _MystatuscardState();
}

class _MystatuscardState extends State<Mystatuscard> {

  File? image;

  Future pickImage(ImageSource source) async
  {
    try{
      final img  = await ImagePicker().pickImage(source: source);
      if(img == null) return;

      final imageTemp = File(img.path);
      setState(() { this.image = imageTemp; });



    }on PlatformException catch (e){
      print(e);
    }
    UploadProfileStatus(image,kUser);
  }
  @override
  Widget build(BuildContext context) {
    return  Container(
      color: Colors.white,
      height: MediaQuery.of(context).size.height *1.5 / kTabSize,
      child: Row(
        children: [
          Expanded(
              flex: 2,
              child: Padding(
                padding: const EdgeInsets.only(left: 15),
                child: Stack(
                  alignment: Alignment.bottomRight,
                  children: [
                    GestureDetector(
                      onTap: (){
                        pickImage(ImageSource.camera);

                      },
                      child: CircleAvatar(
                        radius: 22,
                        backgroundImage: kStatuslink==""?AssetImage("assets/img.png"):NetworkImage(kStatuslink) as ImageProvider,
                      ),
                    ),
                    CircleAvatar(
                      radius: 10,
                      backgroundColor: kThemecolor,
                      child: const Icon(
                          Icons.add,
                        size: 20,
                        color: Colors.white,
                      ),
                    )
                  ],
                ),
              )
          ),

          GestureDetector(
            // onTap: ()
            // {
            //   Navigator.push(context,
            //       MaterialPageRoute(builder: (context) => Statusview(statuslink: widget.statuslink,))
            //   );
            // },
            child: Expanded(
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
                          "My Status",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 18
                          ),
                        ),
                      ),
                      Padding(
                        padding:  EdgeInsets.all(4.0),
                        child: Text(
                          "Tap to add status update",
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
          ),



        ],
      ),
    );
  }
}
