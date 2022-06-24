// ignore_for_file: prefer_const_constructors_in_immutables

import 'package:flutter/material.dart';
import 'package:pinput/pin_put/pin_put.dart';
import 'package:whatsapp/utilities/constants.dart';
import 'package:whatsapp/utilities/firebase/phonenumberauthentication.dart';
// ignore_for_file: prefer_const_constructors
class OtpScreen extends StatefulWidget {
  final String phone;
  // ignore: use_key_in_widget_constructors
  OtpScreen(this.phone);
  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  final GlobalKey<ScaffoldState> _scaffoldkey = GlobalKey<ScaffoldState>();
  final TextEditingController _pinPutController = TextEditingController();
  final FocusNode _pinPutFocusNode = FocusNode();
  final BoxDecoration pinPutDecoration = BoxDecoration(
    color: const Color.fromRGBO(43, 46, 66, 1),
    borderRadius: BorderRadius.circular(10.0),
    border: Border.all(
      color: const Color.fromRGBO(126, 203, 224, 1),
    ),
  );
  @override
  Widget build(BuildContext context) {
    return Material(
      child: SafeArea(
        child: Scaffold( 
          key: _scaffoldkey,
          body: Column(
            children: [
              Container(
                margin: EdgeInsets.only(top: 40),
                child: Center(
                  child: Text(
                    'Verify +91-${widget.phone}',
                    style: TextStyle(
                        color: kThemecolor,
                        fontSize: 25,
                        fontWeight: FontWeight.w600
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top:20,left: 10,right: 10 ),
                child: Text(
                  'OTP has been sent to +91-${widget.phone}.Please Enter the OTP.',
                  style: TextStyle(
                    fontSize: 15,
                  ),
                  textAlign: TextAlign.center,

                ),
              ),
              Padding(
                padding: const EdgeInsets.all(30.0),
                child: PinPut(
                  fieldsCount: 6,
                  textStyle: const TextStyle(fontSize: 25.0, color: Colors.white),
                  eachFieldWidth: 40.0,
                  eachFieldHeight: 55.0,
                  focusNode: _pinPutFocusNode,
                  controller: _pinPutController,
                  submittedFieldDecoration: pinPutDecoration,
                  selectedFieldDecoration: pinPutDecoration,
                  followingFieldDecoration: pinPutDecoration,
                  pinAnimationType: PinAnimationType.fade,
                  onSubmit: (pin) async {
                      verifyCode(pin, context);
                  } ,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

