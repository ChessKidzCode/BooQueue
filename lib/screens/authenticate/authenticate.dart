import 'package:flutter/material.dart';
import 'package:booqueue/screens/authenticate/register.dart';
import 'signin.dart';

class Authenticate extends StatefulWidget {
  const Authenticate({super.key});

  @override
  State<Authenticate> createState() => _AuthenticateState();
}

class _AuthenticateState extends State<Authenticate> {
  bool showSignIn = true;
  void toggleView(){
    setState(() {
      showSignIn = !showSignIn;
    });
  }
  @override
  Widget build(BuildContext context) {
    if (showSignIn){
      print("inside authenticate - show sign in true");
      return SignIn(toggleView: toggleView);
    }
    else{
      print("inside authenticate show register true");
      return Register(toggleView: toggleView);
    }
    // return Scaffold(
    //   body: Text("Auth"),
    // );
    // return Container(
    //   child: Register(toggleView: toggleView,),
    //   );
  }
}