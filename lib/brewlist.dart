import 'package:flutter/material.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:provider/provider.dart';

import 'models/order.dart';
import 'brew_tile.dart';

class BrewList extends StatefulWidget {
  const BrewList({super.key});

  @override
  State<BrewList> createState() => _BrewListState();
}

class _BrewListState extends State<BrewList> {
  @override
  Widget build(BuildContext context) {
    final orders = Provider.of<List<Order>>(context);
    // final brew = brews;
    print("inside brew list.dart");
    // print(brew);
    orders.forEach((order){
      print(order.name);
      print(order.order);
      // print(order.rating);
    });
   
    return ListView.builder(
       itemCount: orders.length,
       itemBuilder: (context, index) {
         return OrderTile(order: orders[index]);
       },
    );
  }
}