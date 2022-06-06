// import 'dart:html';

import 'package:flutter/material.dart';
// import 'package:path/path.dart';
// import 'package:path_provider/path_provider.dart';
import 'package:whatsapp/utilities/constants.dart';
import 'package:camera/camera.dart';





class CameraScreen extends StatefulWidget {
  const CameraScreen({Key? key}) : super(key: key);
  static const String id = 'camera';

  @override
  State<CameraScreen> createState() => _CameraScreenState();
}

class _CameraScreenState extends State<CameraScreen> {

  late CameraController controller;


  @override
  void initState() {
    super.initState();
    controller = CameraController(cameras[0], ResolutionPreset.max);
    controller.initialize().then((_) {
      if (!mounted) {
        return;
      }
      setState(() {});
    }).catchError((Object e) {
      if (e is CameraException) {
        switch (e.code) {
          case 'CameraAccessDenied':
            print('User denied camera access.');
            break;
          default:
            print('Handle other errors.');
            break;
        }
      }
    });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }



  @override
  Widget build(BuildContext context) {
    // void _onCapturePressed(context) async {
    //   try {
    //     // 1
    //     final path = join(
    //       (await getTemporaryDirectory()).path,
    //       '${DateTime.now()}.png',
    //     );
    //     // 2
    //     await controller.takePicture(path);
    //     // 3
    //     Navigator.push(
    //       context,
    //       MaterialPageRoute(
    //         builder: (context) => PreviewImageScreen(ImagePath: path),
    //       ),
    //     );
    //   } catch (e) {
    //     print(e);
    //   }
    // }
    if (!controller.value.isInitialized) {
      return Container();
    }
    return MaterialApp(
      home: CameraPreview(controller),
    );

  }
}
//
// class PreviewImageScreen extends StatelessWidget {
//   final String ImagePath;
//   const PreviewImageScreen({required this.ImagePath});
//
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Image.file(File([],"ImagePath")),
//     );
//   }
// }
