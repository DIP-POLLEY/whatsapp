import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:whatsapp/utilities/constants.dart';

final _firestore = FirebaseFirestore.instance;

void adddata(String message, String phn) async
{
  var firebaseUser = await FirebaseAuth.instance.currentUser;
  String phone = (firebaseUser?.phoneNumber).toString();
  print("Current user = $phone");
  kUser = phone;
  _firestore.collection('users').doc(phone).collection(phn).add({
    'text': message,
    'sender': kUser,
    'timestamp':FieldValue.serverTimestamp(),
  });

}