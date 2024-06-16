import 'package:get/get.dart';
import 'package:netninjapp/brewlist.dart';
import 'package:netninjapp/food_detail.dart';
import 'package:netninjapp/splash/splash_page.dart';
// import 'package:mobileapp/pages/ticket_combo_display.dart';
import 'package:netninjapp/profile_page.dart';
import 'package:netninjapp/playerlist_page.dart';

import '../cart/cart_page.dart';
import '../landing_page.dart';

class RouteHelper{
  static const String initial = "/";
  static const String splashPage = "/splash-page";
  static const String popularFood = "/popular-food";
  // static const String recommendedFood = "/recommended-food";
  static const String cartPage = "/cart-page";
  static const String playerListPage = "/player-list";
  static const String landingPage = "/landing-page";
  static const String practicePage = "/practice-page";
  static const String profilePage = "/profile-page";

  static String getSplashPage()=>'$splashPage';
  static String getPopularFood(int pageId, String page)=>'$popularFood?pageId=$pageId&page=$page';
  static String getInitial()=>'$initial';
  // static String getrecommendedFood(int pageId, String page)=>'$recommendedFood?pageId=$pageId&page=$page';
  static String getCartPage()=>'$cartPage';
  static String getPlayerListPage()=>'$playerListPage';
  static String getLandingPage()=>'$landingPage';
  static String getPracticePage()=>'$practicePage';
  static String getProfilePage()=>'$profilePage';

  static List<GetPage> routes = [
    GetPage(name: profilePage, page: ()=>ProfilePage()),

    GetPage(name: playerListPage, page: ()=>PlayerListPage()),

    // GetPage(name: initial, page: ()=>HomePage()),

    GetPage(name: splashPage, page: ()=>SplashScreen()),

    // GetPage(name: practicePage, page: ()=>ProfilePage()),

    GetPage(name: landingPage, page: ()=>LandingPage()),

    GetPage(name: popularFood, page:(){
      // print("popular-food gets called");
      var pageId=Get.parameters['pageId'];
      var page = Get.parameters["page"];
      return PopularFoodDetail(pageId:int.parse(pageId!), page:page!);
    }, transition: Transition.fadeIn
    ),

    // GetPage(name: recommendedFood, page:(){
    //   // print("popular-food gets called");
    //   var pageId=Get.parameters['pageId'];
    //   var page = Get.parameters["page"];
    //   return RecommendedFoodDetail(pageId:int.parse(pageId!), page:page!);
    // }, transition: Transition.fadeIn
    // ),

    GetPage(name: cartPage, page:(){
      return CartPage();
    }, transition: Transition.fadeIn
    )
  ];
}