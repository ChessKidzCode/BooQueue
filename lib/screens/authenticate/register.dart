import 'package:flutter/material.dart';
import 'package:netninjapp/constants/constants.dart';

import '../../constants/loading.dart';
import '../../services/auth.dart';

class Register extends StatefulWidget {
  final Function toggleView;
  Register({ required this.toggleView });

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final AuthService _auth = AuthService();
  final _formkey = GlobalKey<FormState>();

  String email = '';
  String password = '';
  String error = '';
  bool loading = false;

  @override
  Widget build(BuildContext context) {
    return loading ? Loading() :Scaffold(
      backgroundColor: Colors.brown[100],
      appBar: AppBar(
        backgroundColor: Colors.brown[400],
        elevation: 0.0,
        title: Text('Register in To Coffee Crew'),
        actions: <Widget>[
          TextButton.icon(onPressed: (){
            widget.toggleView();
          },
          icon: Icon(Icons.person),
          label: Text("Sign Up")),
        ],
      ),
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 50.0),
        child: Form(
          key: _formkey,
          child: Column(
            children: <Widget>[
              SizedBox(height: 20.0,),
              TextFormField(
                decoration: textInputDecoration.copyWith(hintText: 'Email'),
                validator: (value) => value!.isEmpty ? 'Enter an Email' : null,
                onChanged: (val){
                  // print(val);
                  setState(() {
                    email = val;
                  });
                },
              ),
              SizedBox(height: 20.0),
              TextFormField(
                decoration: textInputDecoration.copyWith(hintText: 'Password'),
                obscureText: true,
                validator: (value) => value!.length < 6 ? 'Enter 6 or more characters' : null,
                onChanged: (val){
                  setState(() {
                    password = val;
                  });
                  // print(val);
                },
              ),
              SizedBox(height: 20.0,),
              ElevatedButton(
                child: Text('Register', style: TextStyle(color: Colors.white),),
                onPressed: () async {
                  print(_formkey.currentState?.validate());
                  if (_formkey.currentState?.validate() == true){  //validate() checks validator in formfields to validate if satisfied
                    setState(() {
                      loading = true;
                    });
                    dynamic result = await _auth.registerEmailPassword(email, password);
                    // print(result);
                    if (result == null){
                      setState(() {
                        error = 'Enter valid Email/Password';
                        loading = false;
                      });
                    }
                  }
                  
                },
                ),
              SizedBox(height: 12.0,),
              Text(error, style: TextStyle(color: Colors.red, fontSize: 14.0),)
            ],
          ),
        ),
      ),
    );
  }
}