import 'package:flutter/material.dart';
import 'package:booqueue/models/user.dart';
import 'package:provider/provider.dart';

import 'authenticate/authenticate.dart';
import 'home/home.dart';

class Wrapper extends StatelessWidget {
  const Wrapper({super.key});

  @override
  Widget build(BuildContext context) {
    // returns home or authenticate
    // accessing values from our provider package
    final user = Provider.of<AnonUser?>(context);
    // final user = null;
    print('Inside Wrapper ${user}');
    // check if logged in then return authenticate or Home
    if (user == null){
      print("Inside Authenticate");
      return Authenticate();
    }
    else{
      print("User is not null - Home is entered");
      return Home();
    }
    // }
    // return Authenticate();
  }
}