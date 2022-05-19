import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery/Utilities/app_constants.dart';
import 'package:food_delivery/Utilities/colors.dart';
import 'package:food_delivery/Utilities/dimensions.dart';
import 'package:food_delivery/controller/cart_controller.dart';
import 'package:food_delivery/widgets/app_icon.dart';
import 'package:food_delivery/widgets/big_text.dart';
import 'package:food_delivery/widgets/small_text.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class CartHistory extends StatelessWidget {
  const CartHistory({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var getCartHistoryList = Get.find<CartController>().getCartHistoryList();

    Map<String, int> cartItemsPreOrder = Map();

    for (int i = 0; i < getCartHistoryList.length; i++) {
      if (cartItemsPreOrder.containsKey(getCartHistoryList[i].time)) {
        cartItemsPreOrder.update(
            getCartHistoryList[i].time!, (value) => ++value);
      } else {
        cartItemsPreOrder.putIfAbsent(getCartHistoryList[i].time!, () => 1);
      }
    }

    List<int> cartOrderTimeTodoList() {
      return cartItemsPreOrder.entries.map((e) => e.value).toList();
    }

    List<int> itemsPerOrder = cartOrderTimeTodoList();
    List<int> orderTime = cartOrderTimeTodoList();

    var listCounter = 0;

    return Scaffold(
      body: Column(
        children: [
          Container(
            height: 100,
            color: AppColors.mainColor,
            width: double.maxFinite,
            padding: EdgeInsets.only(top: 45),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                BigText(
                  text: "Cart History",
                  color: Colors.white,
                ),
                AppIcon(
                  icon: Icons.shopping_cart_outlined,
                  iconColor: AppColors.mainColor,
                  backgroundColor: AppColors.yellowColor,
                ),
              ],
            ),
          ),
          Expanded(
            child: Container(
              margin: EdgeInsets.only(
                  top: Dimensions.height20,
                  left: Dimensions.width20,
                  right: Dimensions.width20),
              child: MediaQuery.removePadding(
                removeTop: true,
                context: context, child: ListView(
                children: [
                  for (int i = 0; i < itemsPerOrder.length; i++)
                    Container(
                      height: 125,
                      margin: EdgeInsets.only(
                        bottom: Dimensions.height20,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // TODO: This is the way of using dart code in widget to process any data
                          ((){
                            DateTime parseDate = DateFormat("yyyy-MM-dd hh:mm:ss").parse(getCartHistoryList[listCounter].time!);
                           var inputDate = DateTime.parse(parseDate.toString());
                            var outputFormat = DateFormat("MM/dd/yyyy hh:mm a");
                            var outputDate = outputFormat.format(inputDate);
                            return BigText(text: outputDate);

                          }()),
                          SizedBox(height: Dimensions.height20,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Wrap(
                                  direction: Axis.horizontal,
                                  children: List.generate(itemsPerOrder[i], (index) {
                                    if(listCounter < getCartHistoryList.length) {
                                      listCounter++;
                                    }
                                    return index <= 2 ? Container(
                                      margin: EdgeInsets.only(right: Dimensions.width20/2),
                                      height: 80,
                                      width: 80,
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(Dimensions.radius15/2 ),
                                          image: DecorationImage(
                                              fit: BoxFit.cover,
                                              image: NetworkImage(
                                                  AppConstants.BASE_URL + AppConstants.UPLOAD_URL + getCartHistoryList[listCounter - 1].img.toString()
                                              )
                                          )

                                      ),
                                    ) : Container();
                                  })
                              ),
                              Container(
                                height: 80,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                  children: [
                                    SmallText(text: "Total", color: AppColors.titleColor,),
                                    itemsPerOrder[i].toString() == "1" ? BigText(text: itemsPerOrder[i].toString() + " Item" , color: AppColors.titleColor,) : BigText(text: itemsPerOrder[i].toString() + " Items" , color: AppColors.titleColor,),
                                    Container(
                                      padding: EdgeInsets.symmetric(horizontal: Dimensions.width10, vertical: Dimensions.height10/2),
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(Dimensions.radius15/3),
                                        border: Border.all(width: 1, color: AppColors.mainColor)
                                          
                                      ),

                                      child: SmallText(text: "add more", color: AppColors.mainColor,),
                                    )


                                  ],
                                ),
                              )
                            ],
                          )
                        ],
                      ),
                    )
                ],
              ),)
            ),
          )
        ],
      ),
    );
  }
}
