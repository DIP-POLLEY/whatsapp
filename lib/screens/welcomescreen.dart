import 'package:flutter/material.dart';
import 'package:whatsapp/screens/phonenumber.dart';
import 'package:whatsapp/utilities/constants.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({Key? key}) : super(key: key);
  static const String id = 'welcome';
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 25),
                child: Text(
                  'Welcome To Whatsapp',
                  style: TextStyle(
                      color: kThemecolor,
                      fontSize: 25,
                      fontWeight: FontWeight.w600
                  ),
                ),
              ),
              Container(
                height: 290,
                width: 290,
                child: Image.asset("assets/brand.png"),
              ),
              Column(
                children: [
                  Text(
                    "Read our Privacy Policy Tap, 'Agree and continue' to accept the Terms of Service",
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 16),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  ElevatedButton(
                    child: Text(
                      "AGREE AND CONTINUE",
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
                          builder: (_) => PhoneScreen(),
                        ),
                      );
                    },
                  ),
                  SizedBox(
                    height: 30,
                  ),
                ],
              ),
            ],
          ),
      ),
    );
  }
}
