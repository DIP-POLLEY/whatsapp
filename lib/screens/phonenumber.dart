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
  String countryName="Select Country";
  String phonecode="00";

  @override
  Widget build(BuildContext context) {
    return Material(
      child: SafeArea(
          child: Scaffold(

            body: ListView(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 25),
                  child: Text(
                   'Verify your phone number',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: kThemecolor,
                      fontSize: 25,
                      fontWeight: FontWeight.w600
                    ),
                  ),
                ),

                Padding(
                  padding: EdgeInsets.only(
                      top:20,
                      left: (MediaQuery.of(context).size.width/30).toDouble(),
                      right: (MediaQuery.of(context).size.width/30).toDouble(),
                  ),
                  child: Text(
                    'Whasapp will send an SMS message to verify your phone number. Enter your country code and phone number',
                    style: TextStyle(
                      fontSize: 15,
                    ),
                    textAlign: TextAlign.center,

                  ),
                ),
                Padding(
                  padding:  EdgeInsets.only(
                      top:20,
                      left: (MediaQuery.of(context).size.width/15).toDouble(),
                      right: (MediaQuery.of(context).size.width/15).toDouble(),
                  ),
                  child: DropdownButton(
                    isExpanded: true,
                    value: countryName,
                      items: kCountryList.map((String items) {

                        return DropdownMenuItem(
                          value: items,
                            child: Text(
                              items,
                              textAlign: TextAlign.center,
                            )
                        );
                      }).toList(),
                      onChanged: (val){
                        setState(() {
                          countryName = val.toString();
                          phonecode = kPhoneCode[kCountryList.indexOf(countryName)];
                          print(kPhoneCode[kCountryList.indexOf(countryName)]);
                        });
                      }
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                      left: (MediaQuery.of(context).size.width/15).toDouble(),
                      right: (MediaQuery.of(context).size.width/15).toDouble(),
                  ),
                  child: Row(
                    children: [
                      Container(
                        height: (MediaQuery.of(context).size.height/18).toDouble(),
                        decoration: BoxDecoration(
                            border: Border(
                              bottom: BorderSide(
                                color: kThemecolor,
                              )
                            )
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(top: 5
                          ),
                          child: Text(
                            "+$phonecode",
                            style: TextStyle(
                              fontSize: 20,
                            ),
                          ),
                        ),
                        ),
                      SizedBox(
                        width: (MediaQuery.of(context).size.width/25).toDouble(),
                      ),
                      Flexible(
                        child: SizedBox(
                          height: (MediaQuery.of(context).size.height/12).toDouble(),
                          child: TextField(
                            cursorColor: kThemecolor,
                            controller: phonenumber,
                            keyboardType: TextInputType.phone,
                            style: TextStyle(
                              fontSize: 25,
                            ),
                            decoration: InputDecoration(
                              focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                    color: kThemecolor,
                                  width: 2
                                ),
                              ),
                                enabledBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                      color: kThemecolor
                                  ),
                                ),
                                hintText: 'phone number'
                            ),

                          ),
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: (MediaQuery.of(context).size.height/3).toDouble(),
                ),

                Padding(
                  padding:  EdgeInsets.only(
                      left: (MediaQuery.of(context).size.width/3).toDouble(),
                    right: (MediaQuery.of(context).size.width/3).toDouble()
                  ),
                  child: GestureDetector(
                    child: Container(
                      decoration: BoxDecoration(
                          color: Colors.green,
                          borderRadius: BorderRadius.all(Radius.circular(5))
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(10),
                        child: Text(
                          'Next',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 25
                          ),
                        ),
                      ),
                    ),
                    onTap: (){

                      if(phonenumber.text.length==10 && phonecode!="00") {
                        registerUser(phonenumber.text, phonecode, context);
                      }
                      else
                        {
                          print("Invalid data");
                        }
                    },
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                    top:20,
                    left: (MediaQuery.of(context).size.width/30).toDouble(),
                    right: (MediaQuery.of(context).size.width/30).toDouble(),
                  ),
                  child: Text(
                    'You must be atleast 16 years old to use whatsapp. Please check how you can use whatsapp',
                    style: TextStyle(
                      fontSize: 15,
                    ),
                    textAlign: TextAlign.center,

                  ),
                ),
              ],
            ),
          )
      ),
    );
  }
}
