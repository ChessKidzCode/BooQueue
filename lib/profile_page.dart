import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:booqueue/controllers/product_controller.dart';
import 'package:booqueue/tabview.dart';
// import 'package:mobileapp/pages/ticket_combo_display.dart';
// import 'package:mobileapp/pages/landing_page.dart';
// import 'package:mobileapp/pages/bookings_page.dart';
// import 'package:mobileapp/routes/route_helper.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  // List<String> names = ["Tshepo", "Tshbalala", "sidwaba", "mavuso", "Chaka", "jhfjhkf", "yseygygge", "ytyuytetyeyt"];

  @override
  Widget build(BuildContext context) {
    var products_list = Get.find<PopularProductController>().popularProductList;
    
    // print(products_list);
    
    
    // Get.Put
    //  = Get.find<PopularProductController>().popularProductList;
    var d = products_list.length;
    print(d);
    var pr = products_list[0];
    print(pr.name);
    print("Popular_Product_List${products_list[0]}");
    
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        actions: [
          IconButton(
              onPressed: () {
                print("Headed to facebook");
              },
              icon: Icon(Icons.facebook))
        ],
        backgroundColor: Colors.green[300],
        title: Text("Welcome Mavuso"),
      ),
      drawer: Drawer(
        child: Column(
          children: [
            DrawerHeader(
              decoration: BoxDecoration(),
              child: Icon(
                Icons.face_2,
                size: 50,
              ),
            ),
            ListTile(
              leading: Icon(Icons.home),
              title: Text("P L A Y E R - L I S T"),
              onTap: (){
                // Navigator.pop(context);
                // Navigator.pushNamed(context, RouteHelper.getBookingsPage());
              },
            ),
            ListTile(
              leading: Icon(Icons.settings_applications),
              title: Text("E X H I B I T O R S & S T A L L S"),
              onTap: (){
                Navigator.pop(context); //close drawer
                showModalBottomSheet(context: context, builder: (context){
                  return TabView();
                });
              },
            ),
            ListTile(
              leading: Icon(Icons.menu_book),
              title: Text("D I S C O U N T - P O I N T S"),
              onTap: (){},
            ),
          ],
        ),
      ),
      body: ListView.builder(
        // controller: ScrollController(),
        itemCount: products_list.length,
        itemBuilder: (context, index)=> Column(
          // mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GestureDetector(
              onTap: (){

              },
              child: Container(
                margin: EdgeInsets.only(bottom: 10),
                decoration: BoxDecoration(
                  color: Colors.red,
                ),
                width: 100,
                height: 100,
                child: 
                    Center(child: Text(pr.name)),
                    // print("Inside Builder - prodlist= ${products_list}");
              ),
            ),
          ],
        ),
        ),
    );
  }
}
