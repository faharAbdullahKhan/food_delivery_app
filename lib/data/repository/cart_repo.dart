import 'dart:convert';

import 'package:food_delivery/Utilities/app_constants.dart';
import 'package:food_delivery/models/cart_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CartRepo {
  final SharedPreferences sharedPreferences;

  CartRepo({required this.sharedPreferences});

  List<String> cart = [];

  void addToCartList(List<CartModel> cartList) {
    cart = [];

    //Covert objects to string because sharedpreferences on accept string
    cartList.forEach((element) {
      return cart.add(jsonEncode(element));
    });

    sharedPreferences.setStringList(AppConstants.CART_LIST, cart);
    print(sharedPreferences.getStringList(AppConstants.CART_LIST));



  }

  List<CartModel> getCartList(){

    List<String> cart = [];

    if(sharedPreferences.containsKey(AppConstants.CART_LIST)) {
      cart = sharedPreferences.getStringList(AppConstants.CART_LIST)!;
      print("Inside getCartList" + cart.toString());
    }

    List<CartModel> cartList = [];

    cart.forEach((element) { 
      cartList.add(CartModel.fromJson(jsonDecode(element)));
    });


    return cartList;
}

  
}