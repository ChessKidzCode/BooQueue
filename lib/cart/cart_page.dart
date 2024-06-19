import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:netninjapp/controllers/cart_controller.dart';
import 'package:netninjapp/controllers/product_controller.dart';
import 'package:netninjapp/routes/route_helper.dart';
import 'package:netninjapp/utils/colors.dart';
import 'package:netninjapp/utils/dimensions.dart';
import 'package:netninjapp/widgets/app_icon.dart';
import 'package:netninjapp/widgets/big_text.dart';
import 'package:flutter_animated_button/flutter_animated_button.dart';

import '../services/database.dart';
// import 'package:mobileapp/utils/app_constants.dart';


class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 209, 219, 181),
      appBar: AppBar(
                leading: GestureDetector(
                  child: AppIcon(icon: Icons.arrow_back_ios,
                    iconColor: Colors.black87,
                    backgroundColor: AppColors.mainColor,
                    iconSize: Dimensions.iconSize24,),
                  onTap: (){
                    Get.back();
                  },
                ),
                actions: [
                  GestureDetector(
                  onTap: () {
                    Get.toNamed(RouteHelper.getLandingPage());
                  },
                  child: AppIcon(icon: Icons.home_outlined,
                    iconColor: Colors.black87,
                    backgroundColor: AppColors.mainColor,
                    iconSize: Dimensions.iconSize24,),
                ),
                AppIcon(icon: Icons.shopping_cart,
                  iconColor: Colors.black87,
                  backgroundColor: AppColors.mainColor,
                  iconSize: Dimensions.iconSize24,)
                ],
      ),
      body: Stack(
        children: [
          Positioned(
            top: Dimensions.height20*3,
            left: Dimensions.width20,
            right: Dimensions.width20,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                
                // SizedBox(width: Dimensions.width20*5,),
                
                
              ],
            )
          ),
          Positioned(
            top: Dimensions.height20*5,
            left: Dimensions.width20,
            right: Dimensions.width20,
            bottom: 0,
            child: Container(
              // color: Colors.red,
              child: MediaQuery.removePadding(
                context: context,
                removeTop: true,
                child: GetBuilder<CartController>(builder:(CartController){
                  var _cartList = CartController.getItems;
                  return ListView.builder(
                  itemCount: _cartList.length,
                  itemBuilder: (_, index){
                    return Container(
                      margin: EdgeInsets.only(top: Dimensions.height15),
                      width: double.maxFinite,
                      height: Dimensions.height20*5,
                      child: Row(
                        children: [
                          GestureDetector(
                            onTap: (){
                              var popularIndex = Get.find<PopularProductController>()
                              .popularProductList
                              .indexOf(_cartList[index].product!);
                              if(popularIndex>=0){
                                Get.toNamed(RouteHelper.getPopularFood(popularIndex, "cartpage"));
                              }else{
                                print("I removed recommendedFood");
                              //   var recommendedIndex = Get.find<RecommendedProductController>()
                              // .recommendedProductList
                              // .indexOf(_cartList[index].product!);
                              // Get.toNamed(RouteHelper.getrecommendedFood(recommendedIndex, "cartpage"));
                              }
                            },
                            child: Container(
                              width: Dimensions.height20*5,
                              height: Dimensions.height20*5,
                              margin: EdgeInsets.only(bottom: Dimensions.height10),
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  fit: BoxFit.cover,
                                  image: AssetImage(
                                    CartController.getItems[index].img!
                                  )
                                ),
                                borderRadius: BorderRadius.circular(Dimensions.radius20),
                                // color: Colors.red
                              ),
                            ),
                          ),
                          SizedBox(width: Dimensions.width10,),
                          Expanded(
                            child: Container(
                            height: Dimensions.height20*5,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Text(
                                  CartController.getItems[index].name!,),
                                // BigText(text: "Spicy"),
                                // Text(CartController.getItems[index].),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text("R ${CartController.getItems[index].price.toString()}"),
                                    Container(
                                      padding: EdgeInsets.only(top: Dimensions.height10, bottom: Dimensions.height10, left: Dimensions.width10, right: Dimensions.width10),
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(Dimensions.radius20),
                                        color: Colors.green[500]
                                      ),
                                      child: Row(
                                        children: [
                                          GestureDetector(
                                            onTap: (){
                                              CartController.addItem(_cartList[index].product!, -1);
                                            },
                                            // child: Icon(Icons.remove, color: AppColors.signColor,)),
                                            child: Icon(Icons.remove, color: Colors.black87,)),
                                          SizedBox(width: Dimensions.width10/2,),
                                          Text(_cartList[index].quantity.toString()),//popularProduct.inCartItems.toString()),
                                          SizedBox(width: Dimensions.width10/2,),
                                          GestureDetector(
                                            onTap: (){
                                              CartController.addItem(_cartList[index].product!, 1);
                                            },
                                            child: Icon(Icons.add, color: Colors.black87,))
                                        ],
                                      ),
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ))
                        ],
                      ),
                    );
                  },
                );
                })
              ),
          )),

        ],
      ),
      bottomNavigationBar: GetBuilder<CartController>(builder: (CartController){
        return Container(
        height: Dimensions.bottomHeightBar,
        padding: EdgeInsets.only(top: Dimensions.height30, bottom: Dimensions.height30, left: Dimensions.width20, right: Dimensions.width20),
        decoration: BoxDecoration(
          color: AppColors.buttonBackgroundColor,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(Dimensions.radius20*2),
            topRight: Radius.circular(Dimensions.radius20*2)
          )
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              padding: EdgeInsets.only(top: Dimensions.height20, bottom: Dimensions.height20, left: Dimensions.width20, right: Dimensions.width20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(Dimensions.radius20),
                color: Colors.white
              ),
              child: Row(
                children: [
                  
                  SizedBox(width: Dimensions.width10/2,),
                  Text("R "+CartController.totalAmount.toString()),
                  SizedBox(width: Dimensions.width10/2,),
                 
                ],
              ),
            ),
            // GestureDetector(
            //   onTap: (){
            //     print("tapped");
            //         CartController.addToHistory();
                  // },
              // child: Container(
              //   padding: EdgeInsets.only(top: Dimensions.height20, left: Dimensions.width20, right: Dimensions.width20, bottom: Dimensions.height20),   
              //     child: Text("| Check Out"),
              //   decoration: BoxDecoration(
              //     borderRadius: BorderRadius.circular(Dimensions.radius20),
              //     color: AppColors.mainColor
              //   ),
              // ),
              // child: 
              AnimatedButton(
                onPress: (){
                  DatabaseService().updateBalance(CartController.totalAmount, CartController.getItems.toString());
                  CartController.addToHistory();
                },
                width: 200,
                text: 'Check Out!',
                selectedTextColor: Colors.black87,
                transitionType: TransitionType.BOTTOM_TO_TOP,
                textStyle: TextStyle(
                    fontSize: 13,
                    letterSpacing: 1,
                    color: Colors.deepOrange,
                    fontWeight: FontWeight.w300),
              ),
            // ),
          ],
        ),
      );
      }),
    );
  }
}