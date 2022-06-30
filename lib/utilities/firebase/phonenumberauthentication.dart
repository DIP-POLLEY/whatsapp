
// ignore_for_file: avoid_print
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
// ignore: unnecessary_import
import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:whatsapp/screens/homepage.dart';
import 'package:whatsapp/utilities/constants.dart';

import '../../screens/otpscreen.dart';

String _verificationCode="";
String callno="";
Future registerUser(String mobile, String code, BuildContext context) async{

  // ignore: no_leading_underscores_for_local_identifiers
  FirebaseAuth _auth = FirebaseAuth.instance;
  callno = "+$code$mobile";
  kUser = callno;
  _auth.verifyPhoneNumber(
      phoneNumber: "+$code$mobile",
      timeout: const Duration(seconds: 60),
      verificationCompleted: (AuthCredential authCredential){
        _auth.signInWithCredential(authCredential).then((UserCredential result){
          Navigator.pushReplacement(context, MaterialPageRoute(
              // ignore: prefer_const_constructors
              builder: (context) => HomePage(),
          ));
        }).catchError((e){
          print(e);
        });
      },
      verificationFailed: (FirebaseAuthException authException){
        print(authException.message);
      },
      codeSent: (String verifyId,int? resendcode){
          print(verifyId);
          _verificationCode = verifyId;
          Navigator.pushReplacement(context, MaterialPageRoute(
            builder: (context) => OtpScreen(mobile),
          ));
      },
      codeAutoRetrievalTimeout: (String id){
        print(id);
        print("Timeout");
      }
  );
}

Future verifyCode(String pin, BuildContext context) async{

  try {
    await FirebaseAuth.instance
        .signInWithCredential(PhoneAuthProvider.credential(
        verificationId: _verificationCode, smsCode: pin))
        .then((value) async {
      if (value.user != null) {
        SharedPreferences preferences1 = await SharedPreferences.getInstance();
        preferences1.setString('mobile', callno);
        // ignore: use_build_context_synchronously
        Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (context) => const HomePage()),
                (route) => false);
      }
    });
  } catch (e) {
    print(e);
  }

}


