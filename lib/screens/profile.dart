import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:whatsapp/screens/statusfeed.dart';
import 'package:whatsapp/utilities/constants.dart';
import 'dart:io';

import 'homepage.dart';



class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);
  static const String id = 'profile';

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
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

  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xffEDEDED),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 25),
              child: Text(
                "Profile Info",
                style: TextStyle(
                  color: kThemecolor,
                  fontSize: 20,
                ),
              ),
            ),


            GestureDetector(
              onTap: (){
                pickImage(ImageSource.camera);
              },
              child: Stack(
                alignment: Alignment.bottomRight,
                children: [
                   image==null?CircleAvatar(
                    radius: 80,
                    backgroundImage: AssetImage("assets/img.png"),
                  ):
                   Container(
                     height: 100,
                     width: 100,
                     child: ClipRRect(
                       //radius: 80,
                       borderRadius: BorderRadius.circular(100.0),

                       child: Image.file(
                      image!,
                      fit: BoxFit.cover,
                ),
                  ),
                   ),
                  CircleAvatar(
                    radius: 20,
                    backgroundColor: kThemecolor,
                    child: const Icon(
                      Icons.camera_alt,
                      size: 20,
                      color: Colors.white,
                    ),
                  )
                ],
              ),
            ),

            Column(
              children: [
                Container(
                  color: Colors.white,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 30),
                    child: TextField(
                      cursorColor: kThemecolor,
                      decoration: InputDecoration(
                          hintText: "Enter Name",
                          border: InputBorder.none
                      ),
                      // onChanged: (){
                      //
                      // },
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  "This Name will be visible to your other contact.",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.grey,
                  ),
                ),
              ],
            ),

            SizedBox(
              height: 10,
            ),

            ElevatedButton(
              // ignore: sort_child_properties_last
              child: Text(
                "NEXT",
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.white,
                ),
              ),
              style: ElevatedButton.styleFrom(
                primary: Colors.green,
                padding: EdgeInsets.symmetric(horizontal: 25, vertical: 15),
              ),
              onPressed: () {
                Navigator.pushReplacementNamed(context, HomePage.id);
              },
            ),
            SizedBox(
              height: 30,
            ),
          ],
        ),
      ),
    );
  }
}
