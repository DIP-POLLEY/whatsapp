


import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:whatsapp/widgets/chatfeedcard.dart';

import '../../widgets/statusfeedcard.dart';
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

class getStatusgroup extends StatefulWidget {
  @override
  State<getStatusgroup> createState() => _getStatusgroupState();
}

class _getStatusgroupState extends State<getStatusgroup> {
  @override
  Widget build(BuildContext context) {
    return new StreamBuilder<QuerySnapshot>(
        stream: _firestore.collection("Status").snapshots(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return new Text("There is no status");
          }


          List<Statusfeedcard> cardkeeper = [];
          var details = snapshot.data!.docs;
          for(var detl in details){
            var num={};
            num = detl.data()! as Map<String, dynamic>;


            print(num["Phone_Number"]);
            var s1 = num["Phone_Number"];
            var statuslink=num["Status"];

            for(var i=0;i<contactlen;i++)
            {
              //
              if(s1.toString().compareTo(cnkts![i].phones[0].normalizedNumber) == 0 && kUser != s1)
              {
                print(i);
                final wdget = Statusfeedcard(
                  name: cnkts![i].displayName,
                  statuslink: statuslink,
                );
                cardkeeper.add(wdget);

              }
            }
          }
          return cardkeeper.length==0?Column(
            children: [
              Text("Loading")
            ],
          ):Column(
            children: cardkeeper,
          );


        }
    );
  }


}