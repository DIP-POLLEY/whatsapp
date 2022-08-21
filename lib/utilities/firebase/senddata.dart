import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:whatsapp/utilities/constants.dart';
import 'dart:io';

final _firestore = FirebaseFirestore.instance;
FirebaseAuth _auth = FirebaseAuth.instance;

void adddata(String message, String phn) async
{
  var firebaseUser = await FirebaseAuth.instance.currentUser;
  String phone = (firebaseUser?.phoneNumber).toString();
  print("Current user = $phone");
  kUser = phone;
  _firestore.collection('chatroom').doc((int.parse(phone)+int.parse(phn)).toString()).collection("chats").add({
    'text': message,
    'sender': kUser,
    'timestamp':FieldValue.serverTimestamp(),
  });

}
Future<bool> phoneAlready(String Number) async
{
  final QuerySnapshot result = await _firestore.collection('users').where('Phone_Number',isEqualTo: Number).get();
  final List<DocumentSnapshot> documents = result.docs;

  return documents.length>0;
}

Future<bool> StatusAlready(String Number) async
{
  final QuerySnapshot result = await _firestore.collection('Status').where('Phone_Number',isEqualTo: Number).get();
  final List<DocumentSnapshot> documents = result.docs;

  return documents.length>0;
}
Future UploadProfileFirebase(File? image, String number, String Name) async{

  final path = 'profilepics/${image!.path}';
  final file = File(image.path);
  final ref = FirebaseStorage.instance.ref().child(path);
  UploadTask? uploadTask;
  uploadTask = ref.putFile(file);

  SharedPreferences preferences1 = await SharedPreferences.getInstance();
  preferences1.setString('mobile', number);
  preferences1.setString('profilename', Name);

  final snapshot = await uploadTask.whenComplete(() {});

  final urlDownload = await snapshot.ref.getDownloadURL();
  print(urlDownload);
  preferences1.setString('profilepic', urlDownload);
  //adddata("£$urlDownload", number);
  addUsers(number, Name, urlDownload);

}



void addUsers(String Number,String Name, String profileurl) async{

  Map<String,dynamic>data = {};
  data.addAll(
      {
        'Phone_Number': Number,
        'Profile_Name': Name,
        'Profile_Pic':profileurl,
        'timestamp': FieldValue.serverTimestamp(),
      }
  );
  if(await phoneAlready(Number) == false)
    {
      _firestore.collection('users').doc(Number).set(data);
    }
  else
    {
      _firestore.collection('users').doc(Number).update(data);
    }

}

Future UploadProfileStatus(File? image, String number) async{

  final path = 'profilestatus/${image!.path}';
  final file = File(image.path);
  final ref = FirebaseStorage.instance.ref().child(path);
  UploadTask? uploadTask;
  uploadTask = ref.putFile(file);

  // SharedPreferences preferences1 = await SharedPreferences.getInstance();
  // preferences1.setString('mobile', number);
  // preferences1.setString('profilename', Name);

  final snapshot = await uploadTask.whenComplete(() {});

  final urlDownload = await snapshot.ref.getDownloadURL();
  print(urlDownload);
  //preferences1.setString('profilepic', urlDownload);
  //adddata("£$urlDownload", number);
  addStatus(number, urlDownload);

}

void addStatus(String Number, String statusurl) async {
  Map<String, dynamic>data = {};
  data.addAll(
      {
        'Phone_Number': Number,
        'Status': statusurl,
        'timestamp': FieldValue.serverTimestamp(),
      }
  );
  if (await StatusAlready(Number) == false) {
    _firestore.collection("Status").doc(Number).set(data);
  }
  else {
    _firestore.collection('Status').doc(Number).update(data);
  }
}



  Future<void> Logout() async {

  SharedPreferences preferences = await SharedPreferences.getInstance();
  await preferences.clear();
  _auth.signOut();

}