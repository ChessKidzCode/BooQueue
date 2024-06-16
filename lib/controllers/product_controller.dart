import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:netninjapp/controllers/cart_controller.dart';
import 'package:netninjapp/utils/colors.dart';
// import 'package:mobileapp/controllers/cart_controller.dart';
// import 'package:mobileapp/data/repository/popular_product_repo.dart';
// import 'package:mobileapp/models/cart_model.dart';
// import 'package:mobileapp/models/products_model.dart';
// import 'package:mobileapp/utils/colors.dart';

import '../data/repository/product_repo.dart';
import '../models/cart_model.dart';
import '../models/product_model.dart';


class PopularProductController extends GetxController {
  final PopularProductRepo popularProductRepo;

  PopularProductController({required this.popularProductRepo});
  List<dynamic> _popularProductList = [];
  List<dynamic> get popularProductList => _popularProductList;
  late CartController _cart;

  bool _isLoaded = false;
  bool get isLoaded => _isLoaded;

  int _quantity = 0;
  int get quantity => _quantity; //getter function uses arrow notation
  int _inCartItems = 0;
  int get inCartItems => _inCartItems + _quantity;

  Future<void> getPopularProductList() async {
    Response response = await popularProductRepo.getPopularProductList(); //Response type coz getPopularProductList returns a Response type object
    print(response);
    if (response.statusCode == 200) {
      print("got products");
      _popularProductList = []; //to make sure theres no data inside list
      _popularProductList.addAll(Product.fromJson(response.body).products);
      // _isLoaded = true;
      update(); //is more like setstate coz it updates the UI with new data
      print("_popularProductList: $_popularProductList");
      
      _isLoaded = true;
    } else {
      print("didnt get products");
      var response = {
        "total_size": 6,
        "type_id": 2,
        "offset": 0,
        "products": [
          {
            "id": 1,
            "name": "Kota Mince",
            "description":
                "Kota Mince, Cheese with two (2) Chicken Feet and a Glass of your favourite Bev.",
            "price": 120,
            "quantity": 20,
            "img": 'images/kotaMince.jpg',
            "ticket-category": "Early-Bird",
            "created_at": "2021-11-17 10:09:08",
            "updated_at": "2023-11-08 10:33:48",
            "type_id": 2
          },
          {
            "id": 2,
            "name": "Chicken Hard Body",
            "description":
                "Succulent Hard-Body for a Cold-Winter Day.",
            "price": 21,
            "quantity": 5,
            "img": 'images/Iqhude.jpg',
            "ticket-category": "Early-Bird",
            "created_at": "2021-11-17 10:10:43",
            "updated_at": "2023-11-08 10:34:46",
            "type_id": 2
          },
          {
            "id": 6,
            "name": "Pork Trotters",
            "description":
                "Very Hot and Tasty Trotters to kill that Marble HangOver.",
            "price": 18,
            "quantity": 4,
            "img": 'images/nqina.jpg',
            "ticket-category": "Normal-Bird",
            "created_at": "2021-12-23 15:03:24",
            "updated_at": "2023-11-08 10:35:36",
            "type_id": 2
          },
          {
            "id": 7,
            "name": "Skinny Chicken and Roasted Potato Bowl",
            "description":
                "The quality and craftsmanship is on full show. The waiters  signature white tunics are of loosely rumpled linen here versus the crisp whites of the city. The thick galleria walls of the restaurant s three distinct areas are cast in gentle neon so that even your worst wine-fuelled photos turn into atmospheric still lifes. The art, typically, lands a gut punch.From the Bill Henson portraits at the St Kilda restaurant to Shaun Gladwell s beautiful video artworks at Citta, Di Stasio doesn t use pieces to decorate but to provoke. On entry, a bronze cast of Di Stasio s hands jutt out of the wall, immortalised in the sign of the bull – equal parts a rock star welcome and a warning. A trio of powerful works by Kamilaroi artist Reko Rennie, titled Genesis, goes straight for the jugular of unceded sovereignty.",
            "price": 10,
            "quantity": 5,
            "img": 'images/platter.jpg',
            "ticket-category": "Normal-Bird",
            "created_at": "2021-12-23 15:04:49",
            "updated_at": "2023-11-08 10:36:26",
            "type_id": 2
          },
          {
            "id": 10,
            "name": "Pasta with Vegetables",
            "description":
                "Chicken Biryani Served in a Bowl Close Up Photo. Indian Food, Indian Style Rice and Chicken. #Biryani #ChickenBiryani #IndianFood #StockPhoto",
            "price": 12,
            "quantity": 4,
            "img": 'images/Mogodu.jpg',
            "ticket-category": "Normal-Bird",
            "created_at": "2021-12-27 06:29:47",
            "updated_at": "2023-11-08 10:31:21",
            "type_id": 2
          },
          {
            "id": 11,
            "name": "Fruit",
            "description":
                "Ilish Mach aka Hilsa fish is in the season and needless to say, I cooked it a few times this year as well. This year, however, I have used Ilish mach to make simple delicacies mostly. Ilish Beguner Jhol is probably the simplest of the lot, well, after Ilish Mach Bhaja.Ilish Mach aka Hilsa fish is in the season and needless to say, I cooked it a few times this year as well. This year, however, I have used Ilish mach to make simple delicacies mostly. Ilish Beguner Jhol is probably the simplest of the lot, well, after Ilish Mach Bhaja.Ilish Mach aka Hilsa fish is in the season and needless to say, I cooked it a few times this year as well. This year, however, I have used Ilish mach to make simple delicacies mostly. Ilish Beguner Jhol is probably the simplest of the lot, well, after Ilish Mach Bhaja.",
            "price": 150,
            "quantity": 5,
            "img": 'images/GhettoFood.png',
            "ticket-category": "Early-Bird",
            "created_at": "2021-12-27 06:35:34",
            "updated_at": "2023-11-08 10:32:33",
            "type_id": 2
          }
        ]
      };
      _popularProductList=[];
      _popularProductList.addAll(Product.fromJson(response).products);
      print(response);
      print("After Response");
      // _isLoaded = true;
      update();
      _isLoaded = true;
    }
  }

  void setQuantity(bool isIncrement) {
    if (isIncrement) {
      // print("inrement "+ _quantity.toString());
      print("number of items" + _quantity.toString());
      _quantity = checkQuantity(_quantity + 1);
    } else {
      _quantity = checkQuantity(_quantity - 1);
    }
    update(); //built inside getx to update ui in real time
    _isLoaded = true;
  }

//helper for setQuantity
  int checkQuantity(int quantity) {
    if (_inCartItems + quantity < 0) {
      Get.snackbar("Item Count", "Can't reduce anymore",
          backgroundColor: AppColors.mainColor, colorText: Colors.white);
      if (_inCartItems > 0) {
        _quantity = -_inCartItems;
        return _quantity;
      }
      return 0;
    } else if (_inCartItems + quantity > 20) {
      Get.snackbar("Item Count", "Can't add anymore",
          backgroundColor: AppColors.mainColor, colorText: Colors.white);
      return 20;
    } else {
      return quantity;
    }
  }

  // get from storage from previously saved similar items in the cart
  void initProduct(ProductModel product, CartController cart) {
    _quantity = 0;
    _inCartItems = 0;
    _cart = cart;
    var exist = false;
    exist = _cart.existInCart(product);
    print("exist or not" + exist.toString());
    if (exist) {
      _inCartItems = cart.getQuantity(product);
    }
    print("the quantity in the cart is " + _inCartItems.toString());
  }

  void addItem(ProductModel product) {
    _cart.addItem(product, _quantity);

    _quantity = 0;
    _inCartItems = _cart.getQuantity(product);
    _cart.items.forEach((key, value) {
      print("The id is " +
          value.id.toString() +
          " The quantity is " +
          value.quantity.toString());
    });
    update();
  }

  int get totalItems {
    return _cart.totalItems;
  }

  List<CartModel> get getItems {
    return _cart.getItems;
  }
}
