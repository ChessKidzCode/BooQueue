import 'package:flutter/material.dart';
import 'package:netninjapp/landing_page.dart';
import '../models/user.dart';
import 'package:provider/provider.dart';

// import 'authenticate/authenticate.dart';
import 'screens/authenticate/authenticate.dart';

class Wrapper extends StatelessWidget {
  const Wrapper({super.key});

  @override
  Widget build(BuildContext context) {
    // returns home or authenticate
    // accessing values from our provider package
    final user = Provider.of<AnonUser?>(context);
    print('Inside Wrapper ${user}');
    // check if logged in then return authenticate or Home
    if (user == null){
      print("Inside Authenticate user is null");
      return Authenticate();
    }
    else{
      print("User is not null - LandingPage is entered");
      return LandingPage();
    }
    // }
    // return Authenticate();
  }
}