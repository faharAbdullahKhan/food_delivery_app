import 'dart:convert';

import 'package:food_delivery/Utilities/app_constants.dart';
import 'package:food_delivery/models/cart_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CartRepo {
  final SharedPreferences sharedPreferences;

  CartRepo({required this.sharedPreferences});

  List<String> cart = [];
  List<String> cartHistory = [];

  void addToCartList(List<CartModel> cartList) {

    var time = DateTime.now().toString();
    cart = [];


    //Covert objects to string because sharedpreferences on accept string
    cartList.forEach((element) {
      element.time = time;
      return cart.add(jsonEncode(element));
    });

    sharedPreferences.setStringList(AppConstants.CART_LIST, cart);
    print(sharedPreferences.getStringList(AppConstants.CART_LIST));
    getCartList();



  }

  List<CartModel> getCartList(){

    List<String> carts = [];

    if(sharedPreferences.containsKey(AppConstants.CART_LIST)) {
      carts = sharedPreferences.getStringList(AppConstants.CART_LIST)!;
      print("Inside getCartList" + cart.toString());
    }

    List<CartModel> cartList = [];

    // cart.forEach((element) {
    //   cartList.add(CartModel.fromJson(jsonDecode(element)));
    // });

    carts.forEach((element) => cartList.add(CartModel.fromJson(jsonDecode(element))));


    return cartList;
}

  List<CartModel> getCartHistoryList() {
    if(cartHistory.contains(AppConstants.CART_HISTORY_LIST)) {
      cartHistory = [];
      cartHistory = sharedPreferences.getStringList(AppConstants.CART_HISTORY_LIST)!;
    }


    List<CartModel> cartHistoryList = [];
    cartHistory.forEach((element) => cartHistoryList.add(CartModel.fromJson(jsonDecode(element))));

    return cartHistoryList;
  }

 void addToCartHistoryList() {

    if(sharedPreferences.containsKey(AppConstants.CART_HISTORY_LIST)) {
      cartHistory = sharedPreferences.getStringList(AppConstants.CART_HISTORY_LIST)!;
    }
    for(int i = 0; i<cart.length; i++) {
      print("In add to cart history function in CartRepo" + cart[i]);

      cartHistory.add(cart[i]);
    }
    removeCart();
    sharedPreferences.setStringList(AppConstants.CART_HISTORY_LIST, cartHistory);
    print("Length of history list in addCartHistoryList() in CartRepo is " + getCartHistoryList().length.toString());
    
    for(int j = 0; j<getCartHistoryList().length; j++) {
      print("Time of the oreder is addCartHistoryList() in CartRepo  " + getCartHistoryList()[j].time.toString());

    }
 }

 void removeCart() {
   cart = [];
    sharedPreferences.remove(AppConstants.CART_LIST);
 }
  
}