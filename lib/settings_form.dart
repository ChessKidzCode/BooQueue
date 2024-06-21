import 'package:booqueue/models/orders.dart';
import 'package:flutter/material.dart';
// import 'package:booqueue/constants/constants.dart';
import 'package:booqueue/constants/constants.dart';
import 'package:booqueue/constants/loading.dart';
import 'package:booqueue/models/user.dart';
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

  String _currentName = 'Tshepo';
  int _currentBalance = 100;
  int _currentRating = 100;
  DateTime birthDate = DateTime(2024); // instance of DateTime
  String? _birthDateInString;
  bool isDateSelected= false;
  String _currentOrder = 'Mincce';
  int? _price = 500;


  @override
  Widget build(BuildContext context) {

    final user = Provider.of<AnonUser?>(context);
    print("UID: +${user!.uid}");
    // final orders = Provider.of<Orders>(context);
    // String initValue="Select your Birth Date";

    return StreamBuilder<UserData>(
      stream: DatabaseService(uid: user.uid).userData,
      builder: (context, snapshot) {
        print("Inside snapshot: data?: ${snapshot.hasData}");
        if(snapshot.hasData){
          // Map<String,dynamic>.from(snapshot.data as Map);
          // var snapshotData = Map<String,dynamic>.from(snapshot.data as Map);
          UserData userData = snapshot.data as UserData; //typecasting map into userdata object
        
          return Form(
            key: _formKey,
            child: Column(
              children: <Widget>[
                Text(
                  'Enter Player Details.',
                  style: TextStyle(fontSize: 18.0),
                ),
                SizedBox(height: 20.0,),
                TextFormField(
                  initialValue: userData.name,
                  // initialValue: 'New Crew Member',
                  decoration: textInputDecoration,
                  validator: (value) {
                    return value!.isEmpty ? 'Please enter a name': null;
                  },
                  onChanged: (value) => setState(() => _currentName = value),
                ),
                SizedBox(height: 20.0,),
                TextFormField(
                  initialValue: userData.name,
                  // initialValue: '1800 Default',
                  decoration: textInputDecoration,
                  validator: (value) {
                    return value!.isEmpty ? 'What is your Rating?': null;
                  },
                  onChanged: (value) => setState(() => _currentRating = int.parse(value)),
                ),
                SizedBox(height: 20.0,),
                // dropdown
                // DropdownButtonFormField(
                //   decoration: textInputDecoration,
                //   value: _currentSugars ?? userData.sugars,
                //   // value: _currentSugars ?? '0',
                //   items: sugars.map((sugar) {
                //     return DropdownMenuItem(
                //       value: sugar,
                //       child: Text('$sugar sugars'),
                //     );
                //   }).toList(),
                //   onChanged: (value) => setState(() => _currentSugars = value!),
                // ),
                // calendar
                // TextFormField(
                //   decoration: textInputDecoration,
                // ),
                ListTile(
                  leading: Icon(Icons.calendar_today),
                  // title: Text(userData.birthday!),
                  title: Text('2024/02/01'),
                  onTap: ()async{
                    final datePick= await showDatePicker(
                      context: context,
                      initialDate: new DateTime.now(),
                      firstDate: new DateTime(1900),
                      lastDate: new DateTime(2100)
      );
      if(datePick!=null && datePick!=birthDate){
        setState(() {
          birthDate=datePick;
          isDateSelected=!isDateSelected;
          
          // put it here
          _birthDateInString = "${birthDate.month}/${birthDate.day}/${birthDate.year}"; // 08/14/2019
        });
      }
    }),
                // slider
                // Slider(
                //   value: (_currentStrength ?? userData.strength!).toDouble(),
                
                //   activeColor: Colors.brown[_currentStrength ?? userData.strength!],
                  
                //   inactiveColor: Colors.brown[_currentStrength ?? userData.strength!],
                //   min: 0.0,
                //   max: 800.0,
                //   divisions: 8,
                //   onChanged: (value) => setState(() => _currentStrength = value.round()),
                // ),
                ElevatedButton(
                  onPressed: () async {
                    // validate fomr fields to make sure they are not null then uodate values into firestore
                    if (_formKey.currentState!.validate()){
                      await DatabaseService(uid: user.uid).updateUserData(
                        // _currentName ?? userData.name,
                        userData.name ?? _currentName,
                      
                        // _currentRating ?? userData.rating,
                        _currentRating ?? 900,

                        // _birthDateInString ?? userData.birthday!,
                        _birthDateInString ?? '2023/01/01',

                        _currentBalance ?? 0,

                        // _currentOrder ?? userData.order,
                        _currentOrder ?? 'mince',

                        // _price ?? userData.price,
                        _price ?? 500,
                        );
                        // _currentStrength ?? 0);
                        Navigator.pop(context);
                    }
                  },
                  child: Text('Update', style: TextStyle(color: Colors.black),
                  ),
                  style: ElevatedButton.styleFrom(
                        shape: const StadiumBorder(),
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        backgroundColor: Color.fromARGB(255, 209, 219, 181),
                      ),
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