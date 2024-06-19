import 'package:flutter/material.dart';
import 'package:netninjapp/brewlist.dart';
// import 'package:get/get.dart';
// import 'package:mobileapp/controllers/popular_product_controller.dart';
import 'package:netninjapp/cart/cart_page.dart';
import 'package:netninjapp/food_page_body.dart';
import 'package:netninjapp/loadfoodpagebody.dart';
import 'package:netninjapp/routes/route_helper.dart';
import 'package:netninjapp/tabview.dart';
// import 'package:mobileapp/pages/wrapper.dart';
// import 'package:mobileapp/pages/stalls_admin_page.dart';
import 'package:netninjapp/playerlist_page.dart';
import 'package:netninjapp/services/database.dart';
import 'package:provider/provider.dart';

import 'models/orders.dart';
// import 'package:mobileapp/routes/route_helper.dart';

// import 'ticket_combo_display.dart';
// import 'profile_page.dart';

class LandingPage extends StatefulWidget {
  const LandingPage({super.key});

  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  int _selectedIndex = 0;

  List _pages = [
    // BrewList(),
    // FoodPageBody(),
    Loadfoodpagebody(),
    PlayerListPage(),
    // PracticePage3(),
    // CartPage(),
    // BrewList()
  ];

  void _navigateBottomBar(int index){
    setState(() {
      _selectedIndex = index;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.brown[500],
        body: _pages[_selectedIndex],
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _selectedIndex,
          onTap: _navigateBottomBar,
          items: [
            BottomNavigationBarItem(icon:Icon(Icons.home,), label: "Profile Page"),
            BottomNavigationBarItem(icon:Icon(Icons.book), label: "Player List"),
            // BottomNavigationBarItem(icon:Icon(Icons.store_mall_directory), label: "Cart Page"),
          ],
        ),
      );
  }
}