
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:whatsapp/screens/homepage.dart';

import '../../screens/otpscreen.dart';

String _verificationCode="";
Future registerUser(String mobile, BuildContext context) async{

  FirebaseAuth _auth = FirebaseAuth.instance;

  _auth.verifyPhoneNumber(
      phoneNumber: "+91$mobile",
      timeout: Duration(seconds: 60),
      verificationCompleted: (AuthCredential authCredential){
        _auth.signInWithCredential(authCredential).then((UserCredential result){
          Navigator.pushReplacement(context, MaterialPageRoute(
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
        Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (context) => HomePage()),
                (route) => false);
      }
    });
  } catch (e) {
    print(e);
  }

}


