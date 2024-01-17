import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:netninjapp/services/auth.dart';
import 'package:provider/provider.dart';
import 'screens/wrapper.dart';
import 'models/user.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
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
  }
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return StreamProvider<AnonUser?>.value(
      value: AuthService().user,
      initialData: null,
      child: MaterialApp(
        title: 'Flutter Demo',
        
        home: Wrapper(),
      ),
    );
  }
}


