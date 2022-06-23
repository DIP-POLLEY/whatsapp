
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:whatsapp/screens/homepage.dart';

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
      },
      codeAutoRetrievalTimeout: (String id){

      }
  );
}

