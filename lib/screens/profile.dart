import 'package:flutter/material.dart';
import 'package:whatsapp/screens/statusfeed.dart';
import 'package:whatsapp/utilities/constants.dart';



class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);
  static const String id = 'profile';

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


            Stack(
              alignment: Alignment.bottomRight,
              children: [
                const CircleAvatar(
                  radius: 80,
                  backgroundImage: AssetImage("assets/img.png"),
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
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => StatusFeed(),
                  ),
                );
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
