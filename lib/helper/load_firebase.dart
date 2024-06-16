import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
// import 'package:flutter/material.dart';

class LoadFirebase{
  
  Future loadApp() async {
  // WidgetsFlutterBinding.ensureInitialized();
  // if (kIsWeb){
  //   await Firebase.initializeApp(
  //     name: 'food-app',
  //     options: FirebaseOptions(
  //     apiKey: "AIzaSyAEVBBT5sxHScd4US3Ufc5bG0i0m9D9wmE",
  //     authDomain: "food-app-32df2.firebaseapp.com",
  //     projectId: "food-app-32df2",
  //     storageBucket: "food-app-32df2.appspot.com",
  //     messagingSenderId: "43857411412",
  //     appId: "1:43857411412:web:b2bdb9f58af854caeddcc1",
  //     measurementId: "G-XV30N03SKC"
  //     )
  //   );
  //   print("Loaded Connected Firebase");
  // }
  if (kIsWeb){
    await Firebase.initializeApp(options: FirebaseOptions(
      apiKey: "AIzaSyAEVBBT5sxHScd4US3Ufc5bG0i0m9D9wmE",
      appId: "1:43857411412:web:b2bdb9f58af854caeddcc1",
      messagingSenderId: "43857411412",
      projectId: "food-app-32df2"
      )
    );
  }
  else{
    await Firebase.initializeApp();
    print("Loaded NEW Firebase");
  }
  // runApp(const MyApp());
}
}