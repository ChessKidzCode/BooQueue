import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:netninjapp/controllers/cart_controller.dart';
import 'package:netninjapp/models/user.dart';

import '../models/orders.dart';
// import 'package:netninjapp/models/order.dart';

// import '../models/user.dart';

class DatabaseService{
  // collection Reference
  final CollectionReference brewCrew = FirebaseFirestore.instance.collection("player-details");
  final CollectionReference orderCrew = FirebaseFirestore.instance.collection("orders");
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

  Future updateUserData(String name, int rating, String birthday) async {
    
    return await brewCrew.doc(uid).set({
      "name": name,
      // "sugars": sugars,
      "rating": rating,
      // "balance": balance,
      "birthday": birthday,
      // "order": order,
      // "price": price
    });
    
  }

  Future updateBalance(int balance, String order) async {
    return await orderCrew.doc(uid).update({
      "order": order,
      "balance": balance
    });
  }

  

  // brew list from snapshot
  List<Orders> _brewListFromSnapshot(QuerySnapshot snapshot){
    return snapshot.docs.map((doc) {
      // var brewData =  Map<String,dynamic>.from(snapshot.docs.last.data() as Map);
      print("insode brewlist from snapshot");
      print(doc["name"]);
      return Orders(
        name: doc["name"] ?? 'msese',
        // balance: doc["balance"] ?? '0',
        // rating: doc["rating"] ?? 0,
        // birthday: doc["birthday"] ?? '2024/01/01',
        order: doc["order"] ?? 'Kota Mince',
        price: doc["price"] ?? 100,
      );
    },).toList();
  }
  
  // get brews Stream
  Stream<List<Orders>> get orders {
    return orderCrew.snapshots().map(_brewListFromSnapshot);
  }

  // userData from snapshot
  UserData _userDataFromSnapshot(DocumentSnapshot snapshot){
    // var user = Map<String,dynamic>.from(snapshot.docs[0].data() as Map);
    return UserData(
      uid: uid!,
      name: snapshot["name"],
      balance: snapshot["balance"],
      rating: snapshot["rating"],
      birthday: snapshot["birthday"],
    
    );
  }

  // get user doc stream
  Stream<UserData> get userData {
    return brewCrew.doc(uid).snapshots().map(_userDataFromSnapshot);
  }
}