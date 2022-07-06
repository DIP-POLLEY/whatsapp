import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:whatsapp/utilities/constants.dart';

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
void addUsers(String Number) async{

  Map<String,dynamic>data = {};
  data.addAll(
      {'Phone_Number': Number,
        'timestamp': FieldValue.serverTimestamp(),}
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


void Logout()
{

  _auth.signOut();

}