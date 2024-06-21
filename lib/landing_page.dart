import 'package:booqueue/services/auth.dart';
import 'package:flutter/material.dart';
import 'package:booqueue/brewlist.dart';
// import 'package:get/get.dart';
// import 'package:mobileapp/controllers/popular_product_controller.dart';
import 'package:booqueue/cart/cart_page.dart';
import 'package:booqueue/food_page_body.dart';
import 'package:booqueue/loadfoodpagebody.dart';
import 'package:booqueue/routes/route_helper.dart';
import 'package:booqueue/tabview.dart';
// import 'package:mobileapp/pages/wrapper.dart';
// import 'package:mobileapp/pages/stalls_admin_page.dart';
import 'package:booqueue/playerlist_page.dart';
import 'package:booqueue/services/database.dart';
import 'package:provider/provider.dart';

import 'models/orders.dart';
import 'models/user.dart';
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
    return StreamProvider<AnonUser?>.value(
      value: AuthService().user,
      initialData: null,
      child: Scaffold(
          backgroundColor: Color.fromARGB(255, 209, 219, 181),
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
        ),
    );
  }
}