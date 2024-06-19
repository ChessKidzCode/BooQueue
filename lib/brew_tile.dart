import 'package:flutter/material.dart';

import 'models/order.dart';

class OrderTile extends StatelessWidget {
  final Order order;

  OrderTile({ required this.order });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 8.0),
      child: Card(
        margin: EdgeInsets.fromLTRB(20.0, 6.0, 20.0, 0.0),
        child: ListTile(
          leading: CircleAvatar(
            radius: 25.0,
            backgroundColor: Colors.brown[order.price],
          ),
          title: Text(order.name),
          subtitle: Text('Rating ${order.price}'),
        ),
      ),
    );
  }
}