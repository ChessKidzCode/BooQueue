import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:netninjapp/models/orders.dart';
// import 'package:netninjapp/screens/home/settings_form.dart';
// import '../../models/order.dart';
import '../../services/auth.dart';
import 'package:netninjapp/services/database.dart';
import 'package:provider/provider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'brew_list.dart';


class Home extends StatelessWidget {

  final AuthService _auth = AuthService();

  Home({super.key});

  @override
  Widget build(BuildContext context) {

    void _showSettingsPanel() {
      showModalBottomSheet(context: context, builder: (context){
        // return SettingsForm();
        return Text("hgjhgj");
      });
    }
    // wrap home widget with stream provider
    return StreamProvider<List<Orders>>.value(
      value: DatabaseService().orders,
      initialData: [],
      child: Scaffold(
        backgroundColor: Colors.brown[50],
        appBar: AppBar(
          title: Text("Brew Coffee"),
          backgroundColor: Color.fromARGB(255, 209, 219, 181),
          elevation: 0.0,
          actions: <Widget>[
            TextButton.icon(
              onPressed: (){
                _showSettingsPanel();
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