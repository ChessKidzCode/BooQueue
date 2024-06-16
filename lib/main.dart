import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:netninjapp/loadpage.dart';

import 'routes/route_helper.dart';
import 'helper/dependencies.dart' as dep;

import 'controllers/cart_controller.dart';
import 'controllers/product_controller.dart';

// import 'package:netninjapp/landing_page.dart';

// import 'package:mobileapp/pages/food/popular_food_detail.dart';

// import 'pages/home/main_food_page.dart';

//upload dependencies

// import 'provider_training.dart';

import 'screens/wrapper.dart';

  void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dep.init(); //it will wait until all dependencies are initialized
  if (kIsWeb){
    await Firebase.initializeApp(options: FirebaseOptions(
      apiKey: "AIzaSyAEVBBT5sxHScd4US3Ufc5bG0i0m9D9wmE",
      appId: "1:43857411412:web:b2bdb9f58af854caeddcc1",
      messagingSenderId: "43857411412",
      projectId: "food-app-32df2"
      )
    );
    print("Connected to Firebase");
  }
  else{
    await Firebase.initializeApp();
    print("Created new Firebase Instance");
  }
  runApp(const MyApp());
}

// 

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
   
    Get.find<CartController>().getData();
    
    return GetBuilder<PopularProductController>(builder: (_){
      return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Welcome',
      home: LoadPage(),
      // home: Wrapper(),
      // home: Quizzler(),
      // home: App(),
      // home: MappleStory(),
      // home: TabView(),
      // initialRoute: RouteHelper.getFirstPage(),
      // home: MainFoodPage(),
      // initialRoute: RouteHelper.getSplashPage(),
      // home: PopularFoodDetail(),
      // home: RecommendedFoodDetail(),
      // home: SplashScreen(), 
      getPages: RouteHelper.routes,
      // routes: {
      //   '/bookings-page': (context)=>BookingsPage()
      // },
    );
    });
  }
}