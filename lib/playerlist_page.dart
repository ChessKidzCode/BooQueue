import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:booqueue/menu_form.dart';
import 'package:booqueue/models/user.dart';
// import 'package:get/get.dart';
import 'package:booqueue/settings_form.dart';
import 'models/orders.dart';
import '../../services/auth.dart';
import 'package:booqueue/services/database.dart';
import 'package:provider/provider.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:booqueue/brewlist.dart';
import 'loadsettingsform.dart';


class PlayerListPage extends StatelessWidget {

  final AuthService _auth = AuthService();

  PlayerListPage({super.key});

  @override
  Widget build(BuildContext context) {

    void _showSettingsPanel() {
      showModalBottomSheet(context: context, builder: (context){
        return LoadSettingsForm();
        // return SettingsForm();
      });
    }
    // void _showMenuPanel() {
    //   showModalBottomSheet(context: context, builder: (context){
    //     return MenusForm();
        
    //   });
    // }
    // wrap home widget with stream provider
    return StreamProvider<List<Orders>>.value(
        value: DatabaseService().orders,
        initialData: [],
        child: Scaffold(
          backgroundColor: Color.fromARGB(255, 209, 219, 181),
          appBar: AppBar(
            title: Text("Chess Players-List"),
            backgroundColor: Colors.green[200],
            elevation: 0.0,
            actions: <Widget>[
              TextButton.icon(
                onPressed: () async {
                  await _auth.signOut();
                },
                icon: Icon(Icons.person),
                label: Text('Logout')
              ),
              TextButton.icon(
                onPressed: (){
                  print("Trying to Show Settings Panel");
                  return _showSettingsPanel();
                },
              icon: Icon(Icons.settings),
              label: Text("settings"),
              ),
            ],
          ),
          body: BrewList(),
        ),
    );
  }
}
