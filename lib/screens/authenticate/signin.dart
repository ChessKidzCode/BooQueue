import 'package:flutter/material.dart';
import 'package:netninjapp/constants/constants.dart';

import '../../constants/loading.dart';
import '../../services/auth.dart';

class SignIn extends StatefulWidget {
  final Function toggleView;
  SignIn({ required this.toggleView });

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {

  final AuthService _auth = AuthService();
  final _formkey = GlobalKey<FormState>();

  String email = '';
  String password = '';
  String error = '';
  bool loading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.brown[100],
      appBar: AppBar(
        backgroundColor: Colors.brown[400],
        elevation: 0.0,
        title: Text('Sign In to BooQueue'),
        actions: <Widget>[
          TextButton.icon(onPressed: (){
            widget.toggleView();  
          },
          icon: Icon(Icons.person),
          label: Text("Register"))
        ],
      ),
      body: loading ? Loading() : Container(
        padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 50.0),
        child: Form(
          key: _formkey,
          child: Column(
            children: <Widget>[
              SizedBox(height: 20.0,),
              TextFormField(
                decoration: textInputDecoration.copyWith(
                  hintText: 'Email',
                  fillColor: Colors.purple.withOpacity(0.1),
                  filled: true,
                  prefixIcon: const Icon(Icons.person),
                ),
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
                decoration: textInputDecoration.copyWith(
                  hintText: 'Password',
                  fillColor: Colors.purple.withOpacity(0.1),
                  filled: true,
                  prefixIcon: const Icon(Icons.person),
                ),
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
                child: Text('Login', style: TextStyle(color: Colors.white),),
                onPressed: () async {
                 if (_formkey.currentState?.validate() == true){  //validate() checks validator in formfields to validate if satisfied
                    setState(() {
                      loading = true;
                    });
                    dynamic result = await _auth.signInEmailPassword(email, password);
                    if (result == null){
                      setState(() {
                        error = 'Enter valid Email/Password';
                        loading = false;
                      });
                    }
                  }
                },
                style: ElevatedButton.styleFrom(
                        shape: const StadiumBorder(),
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        backgroundColor: Colors.purple,
                      ),
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