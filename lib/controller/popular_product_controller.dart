import 'package:flutter/material.dart';
import 'package:food_delivery/Utilities/colors.dart';
import 'package:food_delivery/controller/cart_controller.dart';
import 'package:food_delivery/data/repository/popular_product_repo.dart';
import 'package:food_delivery/models/cart_model.dart';
import 'package:food_delivery/models/products_model.dart';
import 'package:get/get.dart';

class PopularProductController extends GetxController {
  final PopularProductRepo popularProductRepo;
  PopularProductController({required this.popularProductRepo});

  List<dynamic> _popularProductList = [];
  List<dynamic> get popularProductList => _popularProductList;
  bool isLoaded = false;

  late CartController _cart;

  int _quantity = 0;
  int get quantity => _quantity;
  int _inCartItem =0;
  int get inCartItem => _inCartItem+_quantity;

  Future<void> getPopularProductList()async {
    Response response = await popularProductRepo.getPopularProductList();
    if(response.statusCode == 200) {
          _popularProductList = [];

      _popularProductList.addAll(Product.fromJson(response.body).products!);

      //update() is like setState()
      isLoaded = true;
      update();
    }else {

    }


  }

  void setQuantity(bool isIncrement) {
    if(isIncrement) {
      _quantity = checkQuatity(quantity + 1);
      print("numbers of items" + _quantity.toString());
    }else {
      _quantity = checkQuatity(quantity - 1);
      print("numbers of items in subtract function " + _quantity.toString());
    }

    // update is a fucntion in GetX same as setState that tells UI that something is changing.
    update();
  }

  int checkQuatity(int quantity) {
    if((_inCartItem+quantity) < 0) {
      Get.snackbar("Item count", "Quantity can't be less than 0",
      backgroundColor: AppColors.mainColor,
      colorText: Colors.white);
      if(_inCartItem>0) {
        _quantity = -_inCartItem;
        return _quantity;

      }
      return 0;
    }

    else {
      return quantity;
    }

  }

  void initProduct(ProductModel product, CartController cart) {
    _quantity = 0;
    _inCartItem = 0;
    _cart = cart;
    var exist = false;
    exist = _cart.existInCart(product);
    print("exist or not " + exist.toString());

    if(exist) {
      _inCartItem = _cart.getQuantity(product);
    }
    print("Quantity in the cart is " + _inCartItem.toString());
  }


  //TODO: Calling add item of cart controller to add all items form product controller.
  void addItem(ProductModel product) {
      _cart.addItem(product, _quantity);

      _quantity = 0;
      _inCartItem = _cart.getQuantity(product);

      _cart.items.forEach((key, value) {
        print("This is id  " + value.id.toString() + " The quantity is" + value.quantity.toString());
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
