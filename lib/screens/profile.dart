import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_contacts/flutter_contacts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:whatsapp/screens/splashscreen.dart';
import 'package:whatsapp/screens/statusfeed.dart';
import 'package:whatsapp/utilities/constants.dart';
import 'dart:io';

import '../utilities/firebase/senddata.dart';
import 'homepage.dart';



class ProfileScreen extends StatefulWidget {
  ProfileScreen({Key? key, required this.profilenum}) : super(key: key);
  final String profilenum;
  static const String id = 'profile';

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
   File? image;
   String name="Enter Name";
   String profileimgurl="";
   final TextEditingController _controller = TextEditingController();

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

  Future<void> fetchdata()
   async {
    //print("vdjvnihdsnvvnjv k knd hvdfv");
     SharedPreferences preferences1 = await SharedPreferences.getInstance();
     if(preferences1.getString('profilename')!=null)
       {
         setState(() { name = preferences1.getString('profilename')!; });
         print("name here $name");

       }
     if(preferences1.getString('profilepic')!=null)
     {

       setState(() {profileimgurl = preferences1.getString('profilepic')!; });
       print("name here $profileimgurl");
     }
   }

  @override
   void initState() {
    fetchdata();
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
                   image==null?
                   (
                       profileimgurl==""?CircleAvatar(
                        radius: 80,
                        backgroundImage: AssetImage("assets/img.png"),
                        ):
                       Container(
                         height: 100,
                         width: 100,
                         child: ClipRRect(
                           borderRadius: BorderRadius.circular(100.0),
                           child: Image.network(profileimgurl),
                         ),
                       )
                   )
                       :
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
                      controller: _controller,
                      decoration: InputDecoration(
                          hintText: name,
                          border: InputBorder.none
                      ),
                      // onChanged: (val){
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
                UploadProfileFirebase(image,widget.profilenum,_controller.text);
                Navigator.pushReplacementNamed(context, SplashScreen.id);
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
