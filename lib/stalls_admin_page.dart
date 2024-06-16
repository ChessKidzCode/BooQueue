import 'package:flutter/material.dart';

class PracticePage3 extends StatefulWidget {
  const PracticePage3({super.key});

  @override
  State<PracticePage3> createState() => _PracticePage3State();
}

class _PracticePage3State extends State<PracticePage3> {
  String _message = "";
  TextEditingController userInputController = TextEditingController();

  void greetUser(){
    setState(() {
      _message = userInputController.text;
    });
    
    // print(userInputController.text);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(_message),
          Center(
            child: TextField(
              decoration: InputDecoration(
                hintText: "Enter Password",
                border: OutlineInputBorder()
              ),
              controller: userInputController,
              // autofocus: true,
            ),
          ),
          ElevatedButton(onPressed: greetUser,
          child: Text("Press Me")),
        ],
      ),
    );
  }
}

