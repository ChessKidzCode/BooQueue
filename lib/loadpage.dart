// import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
// import 'package:firebase_core/firebase_core.dart';
import 'package:booqueue/services/auth.dart';
// import 'package:netninjapp/helper/load_firebase.dart';
// import 'package:netninjapp/services/auth.dart';
import 'package:provider/provider.dart';
import '../helper/load_firebase.dart';
import 'wrapper.dart';
import '../models/user.dart';

class LoadPage extends StatelessWidget {
  const LoadPage({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    LoadFirebase().loadApp();
    return StreamProvider<AnonUser?>.value(
      value: AuthService().user,
      initialData: null,
      child: Wrapper()
    );
  }
}