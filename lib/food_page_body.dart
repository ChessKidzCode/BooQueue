// import 'package:flutter/cupertino.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:netninjapp/controllers/product_controller.dart';
import 'package:netninjapp/models/product_model.dart';
import 'package:netninjapp/models/user.dart';
import 'package:netninjapp/services/database.dart';
import 'package:netninjapp/tabview.dart';
import 'package:netninjapp/routes/route_helper.dart';
import 'package:netninjapp/utils/colors.dart';
import 'package:netninjapp/utils/dimensions.dart';
import 'package:netninjapp/widgets/app_column.dart';
import 'package:netninjapp/widgets/big_text.dart';
import 'package:provider/provider.dart';

class FoodPageBody extends StatefulWidget {
  const FoodPageBody({super.key});

  @override
  State<FoodPageBody> createState() => _FoodPageBodyState();
}

class _FoodPageBodyState extends State<FoodPageBody> {
  PageController pageController = PageController(viewportFraction: 0.7);  //sets the controller at pageview to certain fraction
  var _currPageValue=0.0;
  double scaleFactor=0.8;
  double _height=Dimensions.pageViewContainer;

  @override
  void initState(){
    super.initState();
    pageController.addListener(() {
      setState(() {
        _currPageValue=pageController.page!;
        // print("current page value: "+_currPageValue.toString());
      });
    });
  }
  // to avoid memory leak dispose of values on pagecontroller that were received via addlistener
  @override
  void dispose(){
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Get.find<PopularProductController>().getPopularProductList();
    // final user = Provider.of<UserData>(context);
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 209, 219, 181),
      appBar: AppBar(
        elevation: 0,
        actions: [
          IconButton(
              onPressed: () {
                print("Headed to facebook");
              },
              icon: Icon(Icons.facebook))
        ],
        backgroundColor: Colors.green[200],
        title: Text("Welcome Mavuso"),
      ),
      drawer: Drawer(
        backgroundColor: Color.fromARGB(255, 209, 219, 181),
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
              title: Text("E D I T - P R O F I L E"),
              onTap: (){
                // Navigator.pop(context);
                // Navigator.pushNamed(context, RouteHelper.getPlayerListPage());
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
      body: Column(
        children: [
          // slider section
          GetBuilder<PopularProductController>(builder:(popularProducts){
            print("Inside popular product controller :$popularProducts");
            return popularProducts.isLoaded?Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                // color: Colors.red,
                height: Dimensions.pageView,
              
                  child: PageView.builder(
                    controller: pageController,
                    itemCount: popularProducts.popularProductList.length,
                    itemBuilder: (context, position){
                      print("list---1 ${popularProducts.popularProductList[position]}");
                      return _buildPageItem(position, popularProducts.popularProductList[position]);  //function that was declared at the bottom, takes in index which is position in this instance
                  },),
              ),
            ):CircularProgressIndicator(
              color: AppColors.mainColor,
            );
          }),
      // dots indicator
      GetBuilder<PopularProductController>(builder:(popularProducts){
        return DotsIndicator(
        dotsCount: popularProducts.popularProductList.isEmpty?1:popularProducts.popularProductList.length,
        position: _currPageValue,
        decorator: DotsDecorator(
          size: const Size.square(9.0),
          activeColor: AppColors.mainColor,
          activeSize: const Size(18.0, 9.0),
          activeShape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0)),
      ),
    );
      }),
    // Recommended food  Text
      SizedBox(height: Dimensions.height30,),
      Container(
        margin: EdgeInsets.only(left: Dimensions.height30),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            BigText(text: "Recommended"),
            SizedBox(width: Dimensions.width10,),
            Container(
              margin: EdgeInsets.only(bottom: 3),
              child: BigText(text: ".", color: Colors.black26,),
            ),
            SizedBox(width: Dimensions.width10,),
            Container(
              child: BigText(text: "Food Pairing"),
            ),
          ],
        ),
      ),
      // List of Food and Images
      // GetBuilder<RecommendedProductController>(builder: (recommendedProduct){
      //   return recommendedProduct.isLoaded?ListView.builder(
      //   physics: NeverScrollableScrollPhysics(),
      //   shrinkWrap: true,
      //   itemCount: recommendedProduct.recommendedProductList.length,
      //   itemBuilder: (context, index){
      //     return GestureDetector(
      //       onTap: (){
      //         Get.toNamed(RouteHelper.getrecommendedFood(index, "home"));
      //       },
      //       child: Container(
      //         margin: EdgeInsets.only(left: Dimensions.width20, right: Dimensions.width20, bottom: Dimensions.height10),
      //         child: Row(
      //           children: [
      //             //image section
      //             Container(
      //               height: Dimensions.listViewImgSize,
      //               width: Dimensions.listViewTextContSize,
      //               decoration: BoxDecoration(
      //                 borderRadius: BorderRadius.circular(Dimensions.radius20),
      //                 color: Colors.white38,
      //                 image: DecorationImage(
      //                   fit: BoxFit.cover,
      //                   // image: NetworkImage(recommendedProduct.recommendedProductList[index].img!)
      //                   image: AssetImage(recommendedProduct.recommendedProductList[index].img!)
      //                   // image: AssetImage("images/babies_logo.jpg"),
      //                 )
      //               ),
      //             ),
      //             //text container
      //             Expanded(
      //               child: Container(
      //                 height: Dimensions.listViewTextContSize,
      //                 // width: 200,
      //                 decoration: BoxDecoration(
      //                   borderRadius: BorderRadius.only(
      //                     topRight: Radius.circular(Dimensions.radius20),
      //                     bottomRight: Radius.circular(Dimensions.radius20),
      //                   ),
      //                   color: Colors.white,
      //                 ),
      //                 child: Padding(
      //                   padding: EdgeInsets.only(left: Dimensions.width10, right: Dimensions.width10),
      //                   child: Column(
      //                     crossAxisAlignment: CrossAxisAlignment.start,
      //                     mainAxisAlignment: MainAxisAlignment.center,
      //                     children: [
      //                       BigText(text: recommendedProduct.recommendedProductList[index].name!),
      //                       SizedBox(height: Dimensions.height10,),
      //                       SmallText(text: "With Chinese Characteristics"),
      //                       SizedBox(height: Dimensions.height10,),
      //                       Row(
      //                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //                         children: [
      //                           IconAndTextWidget(icon: Icons.circle_sharp,
      //                             text: "Normal",
      //                             iconColor: AppColors.iconColor1
      //                           ),
      //                           SizedBox(width: Dimensions.width10,),
      //                           IconAndTextWidget(icon: Icons.location_on,
      //                             text: "1.7km",
      //                             iconColor: AppColors.mainColor
      //                           ),
      //                           SizedBox(width: Dimensions.width10,),
      //                           IconAndTextWidget(icon: Icons.access_time_rounded,
      //                             text: "32min",
      //                             iconColor: AppColors.iconColor2
      //                           )
      //                         ],
      //                       )
      //                     ],
      //                   ),
      //                 ),
      //               ),
      //             ),
      //           ],
      //         ),
      //       ),
      //     );
      
      // }):CircularProgressIndicator(
      //         color: AppColors.mainColor,
      //       );
      // })
        ],
      ),
    );
  }

  Widget _buildPageItem(int index, ProductModel popularProduct){
    Matrix4 matrix = new Matrix4.identity();
    if(index == _currPageValue.floor()){
      var currScale = 1 - (_currPageValue-index)*(1-scaleFactor);
      var currTrans= _height*(1-currScale)/2;
      matrix = Matrix4.diagonal3Values(1, currScale, 1)..setTranslationRaw(0, currTrans, 0);

    }else if(index == _currPageValue.floor()+1){
      var currScale = scaleFactor + (_currPageValue - index+1)*(1-scaleFactor);
      var currTrans= _height*(1-currScale)/2;
      matrix = Matrix4.diagonal3Values(1, currScale, 1)..setTranslationRaw(0, currTrans, 0);
      
    }else if(index == _currPageValue.floor()-1){
      var currScale = 1 - (_currPageValue-index)*(1-scaleFactor);
      var currTrans= _height*(1-currScale)/2;
      matrix = Matrix4.diagonal3Values(1, currScale, 1)..setTranslationRaw(0, currTrans, 0);
    }else{
      var currScale=0.8;
      matrix = Matrix4.diagonal3Values(1, currScale, 1)..setTranslationRaw(0, _height*(1-scaleFactor)/2, 0);
    } 
    return Transform(
      transform: matrix,
      child: Stack(
        children: [
          GestureDetector(
            onTap: (){
              Get.toNamed(RouteHelper.getPopularFood(index, "landing-page"));
            },
            child: Container(
              // color: Colors.green,
              height: Dimensions.pageViewContainer,
              margin: EdgeInsets.only(left: Dimensions.width10, right: Dimensions.width10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(Dimensions.radius30),
                color: index.isEven?Color(0xFF69C5df):Color(0xFF9294cc),
                image: DecorationImage(
                  fit: BoxFit.cover,
                  // image: AssetImage("images/babies_logo.jpg")
                  // image: NetworkImage(popularProduct.img!)
                  image: AssetImage(popularProduct.img!)  //using network image value
                )
              ),
              // child: Image.asset("images/babies_logo.jpg")
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: Dimensions.pageViewTextContainer,
              margin: EdgeInsets.only(left: Dimensions.width30, right: Dimensions.width30, bottom: Dimensions.height30),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(Dimensions.radius20),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Color(0xFFe8e8e8),
                    blurRadius: 5.0,
                    offset: Offset(0, 5)
                  ),
                  BoxShadow(
                    color: Colors.white,
                    offset: Offset(-5, 0)
                  ),
                  BoxShadow(
                    color: Colors.white,
                    offset: Offset(5, 0)
                  )
                ]
              ),
              child: Container(
                padding: EdgeInsets.only(top: Dimensions.height15, left: Dimensions.width15, right: Dimensions.width15),
                child: AppColumn(text: popularProduct.name!,stars: popularProduct.quantity!)
              ),
            ),
          ),]
        ),
    );
    }
  }