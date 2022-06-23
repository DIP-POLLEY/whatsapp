import 'dart:ffi';

import 'package:camera/camera.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:whatsapp/screens/camerascreen.dart';
import 'package:whatsapp/screens/homepage.dart';
import 'package:whatsapp/screens/phonenumber.dart';
import 'package:whatsapp/screens/splashscreen.dart';
import 'package:whatsapp/utilities/constants.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(

  );
  cameras = await availableCameras();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {


  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
     initialRoute: SplashScreen.id,
      routes: {
        HomePage.id : (context) => const HomePage(),
        CameraScreen.id : (context) => const CameraScreen(),
        PhoneScreen.id : (context) => const PhoneScreen(),
        SplashScreen.id : (context) => const SplashScreen(),
      },
    );
  }
}
