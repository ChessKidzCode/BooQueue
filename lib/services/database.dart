import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:netninjapp/models/brew.dart';

import '../models/user.dart';

class DatabaseService{
  // collection Reference
  final CollectionReference brewCrew = FirebaseFirestore.instance.collection("player-details");
  // List<Brew> b = []; 
  // var a = FirebaseFirestore.instance
  //   .collection('brews')
  //   .get()
  //   .then((QuerySnapshot querySnapshot) {
  //       querySnapshot.docs.forEach((doc) {
  //           print(Brew(
  //             name: doc["name"],
  //             sugars: doc["sugars"],
  //             strength: doc["strength"]
  //           ));
  //       });
    
  //   });
  
  final String? uid;
  DatabaseService({this.uid});

  Future updateUserData(String sugars, String name, int strength, String birthday, String order, int price) async {
    
    return await brewCrew.doc(uid).set({
      "name": name,
      "sugars": sugars,
      "strength": strength,
      "birthday": birthday,
      "order": order,
      "price": price
    });
    
  }
  // brew list from snapshot
  List<Brew> _brewListFromSnapshot(QuerySnapshot snapshot){
    return snapshot.docs.map((doc) {
      // var brewData =  Map<String,dynamic>.from(snapshot.docs.last.data() as Map);
      print("insode brewlist from snapshot");
      print(doc["name"]);
      return Brew(
        name: doc["name"] ?? '',
        sugars: doc["sugars"] ?? '0',
        strength: doc["strength"] ?? 0,
        birthday: doc["birthday"] ?? '2024/01/01',
        order: doc["order"] ?? 'Kota Mince',
        price: doc["price"] ?? 1,
      );
    },).toList();
  }
  
  // get brews Stream
  Stream<List<Brew>> get brews {
    return brewCrew.snapshots().map(_brewListFromSnapshot);
  }

  // userData from snapshot
  UserData _userDataFromSnapshot(DocumentSnapshot snapshot){
    // var user = Map<String,dynamic>.from(snapshot.docs[0].data() as Map);
    return UserData(
      uid: uid,
      name: snapshot["name"],
      sugars: snapshot["sugars"],
      strength: snapshot["strength"],
      birthday: snapshot["birthday"],
    
    );
  }

  // get user doc stream
  Stream<UserData> get userData {
    return brewCrew.doc(uid).snapshots().map(_userDataFromSnapshot);
  }
}