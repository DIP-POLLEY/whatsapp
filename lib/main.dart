import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:whatsapp/screens/camerascreen.dart';
import 'package:whatsapp/screens/homepage.dart';
import 'package:whatsapp/utilities/constants.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  cameras = await availableCameras();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
     initialRoute: HomePage.id,
      routes: {
        HomePage.id : (context) => const HomePage(),
        CameraScreen.id : (context) => const CameraScreen(),
      },
    );
  }
}