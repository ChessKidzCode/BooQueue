import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:netninjapp/menu_form.dart';
import 'package:netninjapp/models/user.dart';
// import 'package:get/get.dart';
import 'package:netninjapp/settings_form.dart';
import 'models/orders.dart';
import '../../services/auth.dart';
import 'package:netninjapp/services/database.dart';
import 'package:provider/provider.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:netninjapp/brewlist.dart';


class PlayerListPage extends StatelessWidget {

  final AuthService _auth = AuthService();

  PlayerListPage({super.key});

  @override
  Widget build(BuildContext context) {

    void _showSettingsPanel() {
      showModalBottomSheet(context: context, builder: (context){
        return SettingsForm();
      });
    }
    void _showMenuPanel() {
      showModalBottomSheet(context: context, builder: (context){
        return MenusForm();
        
      });
    }
    // wrap home widget with stream provider
    return StreamProvider<List<Orders>?>.value(
      value: DatabaseService().orders,
      initialData: [],
      child: StreamProvider<UserData?>.value(
        value: DatabaseService().userData,
        initialData: null,
        child: Scaffold(
          backgroundColor: Color.fromARGB(255, 209, 219, 181),
          appBar: AppBar(
            title: Text("Chess Players-List"),
            backgroundColor: Colors.green[200],
            elevation: 0.0,
            actions: <Widget>[
              TextButton.icon(
                onPressed: (){
                  _showMenuPanel();
                },
                icon: Icon(Icons.menu_open),
                label: Text("Menu")
                ),
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
      ),
    );
  }
}
