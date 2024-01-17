import 'package:flutter/material.dart';
import 'package:netninjapp/constants/constants.dart';
import 'package:netninjapp/constants/loading.dart';
import 'package:netninjapp/models/user.dart';
import 'package:provider/provider.dart';

import '../../services/database.dart';


class SettingsForm extends StatefulWidget {
  SettingsForm({super.key});

  @override
  State<SettingsForm> createState() => _SettingdFormState();
}

class _SettingdFormState extends State<SettingsForm> {

  final _formKey = GlobalKey<FormState>();
  final List<String> sugars = ['0', '1', '2', '3', '4'];

  String? _currentName;
  String? _currentSugars;
  int? _currentStrength;


  @override
  Widget build(BuildContext context) {

    final user = Provider.of<AnonUser>(context);

    return StreamBuilder<UserData>(
      stream: DatabaseService(uid: user.uid).userData,
      builder: (context, snapshot) {
        if(snapshot.hasData){
          // Map<String,dynamic>.from(snapshot.data as Map);
          // var snapshotData = Map<String,dynamic>.from(snapshot.data as Map);
          UserData userData = snapshot.data as UserData; //typecasting map into userdata object
        
          return Form(
            key: _formKey,
            child: Column(
              children: <Widget>[
                Text(
                  'Update your brew Settings.',
                  style: TextStyle(fontSize: 18.0),
                ),
                SizedBox(height: 20.0,),
                TextFormField(
                  initialValue: userData.name,
                  decoration: textInputDecoration,
                  validator: (value) {
                    return value!.isEmpty ? 'Please enter a name': null;
                  },
                  onChanged: (value) => setState(() => _currentName = value),
                ),
                SizedBox(height: 20.0,),
                // dropdown
                DropdownButtonFormField(
                  decoration: textInputDecoration,
                  value: _currentSugars ?? userData.sugars,
                  items: sugars.map((sugar) {
                    return DropdownMenuItem(
                      value: sugar,
                      child: Text('$sugar sugars'),
                    );
                  }).toList(),
                  onChanged: (value) => setState(() => _currentSugars = value!),
                ),
                // slider
                Slider(
                  value: (_currentStrength ?? userData.strength!).toDouble(),
                  activeColor: Colors.brown[_currentStrength ?? userData.strength!],
                  inactiveColor: Colors.brown[_currentStrength ?? userData.strength!],
                  min: 100.0,
                  max: 900.0,
                  divisions: 8,
                  onChanged: (value) => setState(() => _currentStrength = value.round()),
                ),
                ElevatedButton(
                  onPressed: () async {
                    // validate fomr fields to make sure they are not null then uodate values into firestore
                    if (_formKey.currentState!.validate()){
                      await DatabaseService(uid: user.uid).updateUserData(
                        _currentSugars ?? userData.sugars!,
                        _currentName ?? userData.name!,
                        _currentStrength ?? userData.strength!);
                        Navigator.pop(context);
                    }
                  },
                  child: Text('Update', style: TextStyle(color: Colors.white),
                  )
                ),
              ],
            ),
          );
        }else{
          return Loading();
        }
        
      }
    );
  }
}