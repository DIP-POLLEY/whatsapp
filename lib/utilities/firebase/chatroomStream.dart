


import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:whatsapp/widgets/chatfeedcard.dart';

import '../constants.dart';
//
// CollectionReference _collectionRef =
// FirebaseFirestore.instance.collection('users');
//
// Future<void> getData() async {
//   // Get docs from collection reference
//   QuerySnapshot querySnapshot = await _collectionRef.get();
//
//   // Get data from docs and convert map to List
//   final allData = querySnapshot.docs.map((doc) => doc.data()).toList();
//
//   print(allData.first);
// }



final _firestore = FirebaseFirestore.instance;
Map<String, dynamic>? data;

class getChatgroup extends StatefulWidget {
  @override
  State<getChatgroup> createState() => _getChatgroupState();
}

class _getChatgroupState extends State<getChatgroup> {
  @override
  Widget build(BuildContext context) {
    return new StreamBuilder<QuerySnapshot>(
        stream: _firestore.collection("users").snapshots(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (!snapshot.hasData) {
            return new Text("There is no chat");
          }
          else
          {
            return ListView(
              children: snapshot.data!.docs.map((DocumentSnapshot document) {
                Map<String, dynamic> data = document.data()! as Map<String, dynamic>;


                return ChatFeedCard(
                    sender: data["Phone_Number"],
                );

              }
              ).toList(),
            );
          };
        }
        );
  }


}