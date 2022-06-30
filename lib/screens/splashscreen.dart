
// ignore_for_file: avoid_print, use_build_context_synchronously, duplicate_ignore

// ignore: unnecessary_import
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_contacts/contact.dart';
import 'package:flutter_contacts/flutter_contacts.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:whatsapp/screens/homepage.dart';
import 'package:whatsapp/screens/welcomescreen.dart';
import 'package:whatsapp/utilities/constants.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);
  static const String id = 'splash';

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  void fetchCnct() async{
    List<Contact> contacts = await FlutterContacts.getContacts(
        withProperties: true, withPhoto: true);
    print(contacts);
  }


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    checklogin();
    fetchCnct();
  }

  void checklogin() async
  {
    WidgetsFlutterBinding.ensureInitialized();
    SharedPreferences preferences = await SharedPreferences.getInstance();
    String mob = preferences.getString("mobile").toString();
    if(preferences.getString("mobile")!=null)
    // ignore: duplicate_ignore
    {
      setState(() { kUser = mob; });

      // ignore: use_build_context_synchronously
      Navigator.pushReplacementNamed(context, HomePage.id);
      print("Loging   directly");
    }
    else
      {
        Navigator.pushReplacementNamed(context, WelcomeScreen.id);
      }
  }



  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          // ignore: avoid_unnecessary_containers
          body: Container(
              // ignore: prefer_const_constructors
              child: Text(
                "Splash Screen"
            ),
    ),
        ),
    );
  }
}
