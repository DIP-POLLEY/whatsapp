


import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:whatsapp/screens/homepage.dart';
import 'package:whatsapp/screens/phonenumber.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);
  static const String id = 'splash';

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    checklogin();
  }
  void checklogin() async
  {
    WidgetsFlutterBinding.ensureInitialized();
    SharedPreferences preferences = await SharedPreferences.getInstance();

    if(preferences.getString("mobile")!=null)
    {
      Navigator.pushReplacementNamed(context, HomePage.id);
      print("Loging   directly");
    }
    else
      {
        Navigator.pushReplacementNamed(context, PhoneScreen.id);
      }
  }



  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Container(
      child: Text(
        "Splash Screen"
      ),
    ));
  }
}