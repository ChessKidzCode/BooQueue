import 'package:flutter/material.dart';
import 'package:netninjapp/screens/home/settings_form.dart';
import '../../models/brew.dart';
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
        return SettingsForm();
      });
    }
    // wrap home widget with stream provider
    return StreamProvider<List<Brew>>.value(
      value: DatabaseService().brews,
      initialData: [],
      child: Scaffold(
        backgroundColor: Colors.brown[50],
        appBar: AppBar(
          title: Text("Brew Coffee"),
          backgroundColor: Colors.brown[400],
          elevation: 0.0,
          actions: <Widget>[
            TextButton.icon(
              onPressed: (){},
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