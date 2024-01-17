import 'package:flutter/material.dart';
import 'package:netninjapp/models/user.dart';
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
    print('Inside Wrapper ${user}');
    // check if logged in then return authenticate or Home
    if (user == null){
      return Authenticate();
    }
    else{
      return Home();
    }
    // }
    // return Authenticate();
  }
}