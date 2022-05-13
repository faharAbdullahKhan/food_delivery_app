import 'package:flutter/material.dart';
import 'package:food_delivery/Utilities/colors.dart';
import 'package:food_delivery/data/repository/cart_repo.dart';
import 'package:food_delivery/models/cart_model.dart';
import 'package:food_delivery/models/products_model.dart';
import 'package:get/get.dart';

class CartController extends GetxController {
  final CartRepo cartRepo;
  CartController({required this.cartRepo});
  Map<int, CartModel> _items = {};

  Map<int, CartModel> get items => _items;

//TODO: Adding all values from product model to Cart controller
  void addItem(ProductModel product, int quantity) {
    var totalQuantity = 0;
    print("Length of item is " + _items.length.toString());
    if (_items.containsKey(product.id!)) {
      _items.update(product.id!, (value) {

        totalQuantity = value.quantity! + quantity;

        return CartModel(
          id: value.id,
          name: value.name,
          price: value.price,
          img: value.img,
          quantity: value.quantity! + quantity,
          isExist: true,
          time: DateTime.now().toString(),
          product: product,
        );
      });

      if(totalQuantity <= 0) {
        _items.remove(product.id!);
      }
    } else {
     if (quantity > 0) {
       _items.putIfAbsent(product.id!, () {
         print("adding item to cart id  " +
             product.id.toString() + " Quantity " +
             quantity.toString());
         _items.forEach((key, value) {
           print("Quantit is " + value.quantity.toString());

         });
         return CartModel(
           id: product.id,
           name: product.name,
           price: product.price,
           img: product.img,
           quantity: quantity,
           isExist: true,
           time: DateTime.now().toString(),
           product: product,
         );
       });
     }else {
       print("this is snakc");
       Get.snackbar("Message", "Add at least 1 item",
           backgroundColor: AppColors.mainColor,
           colorText: Colors.white);
       print("this is snakc");
     }
    }
    update();
  }

  //TODO: Check method to check if cart have item or not

  bool existInCart(ProductModel product) {
    if(_items.containsKey(product.id)) {
      return true;
    }
    return false;
  }

  int getQuantity(ProductModel product) {
    var quantity = 0;
    if(_items.containsKey(product.id)) {
      _items.forEach((key, value) {
        if(key == product.id) {
          quantity = value.quantity!;
        }
      });
    }

    return quantity;
  }


  //TODO: It is a getter it return a field not a function, dart mai houta hai essa option
  //TODO: It is like a function but not a function it is use to return data in dart.
  int get totalItems{
    var totalQuantity = 0;
    _items.forEach((key, value) {
      totalQuantity = totalQuantity + value.quantity!;
    });

    return totalQuantity;


  }

  List<CartModel> get getItems {
    return _items.entries.map((e) {
      return e.value;
    }).toList();
  }

  int get totalAmount {
    var total = 0;

    _items.forEach((key, value) {
      total += value.quantity!* value.price!;

    });

    return total;
  }
}
