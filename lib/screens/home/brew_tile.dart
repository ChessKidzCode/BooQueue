import 'package:flutter/material.dart';
import 'package:netninjapp/models/order.dart';

class BrewTile extends StatelessWidget {
  final Order brew;

  BrewTile({ required this.brew });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 8.0),
      child: Card(
        margin: EdgeInsets.fromLTRB(20.0, 6.0, 20.0, 0.0),
        child: ListTile(
          leading: CircleAvatar(
            radius: 25.0,
            backgroundColor: Colors.brown[brew.price],
          ),
          title: Text(brew.name),
          subtitle: Text('Rating ${brew.name}'),
        ),
      ),
    );
  }
}