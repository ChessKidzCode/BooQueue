import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:booqueue/utils/dimensions.dart';

import '../../controllers/product_controller.dart';
// import '../../controllers/recommended_product_controller.dart';
import '../../routes/route_helper.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> with TickerProviderStateMixin{
  late Animation<double> animation;
  late AnimationController controller;

  // Future<void> _loadResource()async {
  //   await Get.find<PopularProductController>().getPopularProductList();
  //   print("resources loaded");
  
  //   // await Get.find<RecommendedProductController>().getRecommendedProductList();
  // }
  @override
  void initState(){
    super.initState();
    // _loadResource();
    controller = AnimationController(vsync: this, duration: const Duration(seconds: 2))..forward();

    animation = CurvedAnimation(parent: controller, curve: Curves.linear);
    // controller.dispose();
    // dispose();
    Timer(const Duration(seconds: 3), () { 
      print("Timer Started");
      Get.offNamed(RouteHelper.getLandingPage());
      dispose();
    });
    
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ScaleTransition(
            scale: animation,
            child: Center(child: Text("Welcome"))),
        ],
      ),
    );
  }
}