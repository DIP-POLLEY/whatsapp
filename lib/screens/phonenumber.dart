// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:whatsapp/utilities/constants.dart';
import 'package:whatsapp/utilities/firebase/phonenumberauthentication.dart';

// ignore_for_file: prefer_const_constructors
class PhoneScreen extends StatefulWidget {
  const PhoneScreen({Key? key}) : super(key: key);
  static const String id = 'phone';

  @override
  State<PhoneScreen> createState() => _PhoneScreenState();
}

class _PhoneScreenState extends State<PhoneScreen> {

  TextEditingController phonenumber =  TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(

          body: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 25),
                child: Text(
                 'Verify your phone number',
                  style: TextStyle(
                    color: kThemecolor,
                    fontSize: 25,
                    fontWeight: FontWeight.w600
                  ),
                ),
              ),

              Padding(
                padding: const EdgeInsets.only(top:20,left: 10,right: 10 ),
                child: Text(
                  'Whasapp will send an SMS message to verify your phone number. Enter your country code and phone number',
                  style: TextStyle(
                    fontSize: 15,
                  ),
                  textAlign: TextAlign.center,

                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 15,left: 35,right: 15),
                child: TextField(
                  controller: phonenumber,
                  keyboardType: TextInputType.phone,
                  style: TextStyle(
                    fontSize: 25,
                  ),
                  decoration: InputDecoration(
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: kThemecolor),
                      ),
                      hintText: 'phone number'
                  ),

                ),
              ),
              SizedBox(
                height: 200,
              ),
              GestureDetector(
                child: Container(
                  color: Colors.greenAccent,
                  child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: Text(
                      'Next',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 30
                      ),
                    ),
                  ),
                ),
                onTap: (){
                  print(phonenumber.text);
                  registerUser(phonenumber.text, context);
                },
              )

            ],
          ),
        )
    );
  }
}
