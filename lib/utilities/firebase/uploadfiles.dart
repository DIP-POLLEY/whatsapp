
import 'dart:io';



import 'package:firebase_storage/firebase_storage.dart';
import 'package:whatsapp/utilities/firebase/senddata.dart';

Future Uploadtofirebase(File? image, String number) async
{
  final path = 'images/${image!.path}';
  final file = File(image.path);
  final ref = FirebaseStorage.instance.ref().child(path);
  UploadTask? uploadTask;
  uploadTask = ref.putFile(file);

  final snapshot = await uploadTask.whenComplete(() {});

  final urlDownload = await snapshot.ref.getDownloadURL();
  print(urlDownload);
  adddata("£$urlDownload", number);



}