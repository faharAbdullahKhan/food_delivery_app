import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery/Utilities/colors.dart';
import 'package:food_delivery/Utilities/dimensions.dart';
import 'package:food_delivery/widgets/account_widget.dart';
import 'package:food_delivery/widgets/app_icon.dart';
import 'package:food_delivery/widgets/big_text.dart';

class AccountPage extends StatelessWidget {
  const AccountPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.mainColor,
        automaticallyImplyLeading: false,
        title: BigText(
          text: "Profile",
          size: 24,
          color: Colors.white,
        ),
      ),
      body: Container(
        width: double.maxFinite,
        margin: EdgeInsets.only(top: Dimensions.height20),
        child: Column(
          children: [
            AppIcon(
              icon: Icons.person,
              iconSize: Dimensions.height30 + Dimensions.height45,
              backgroundColor: AppColors.mainColor,
              iconColor: Colors.white,
              size: Dimensions.height15 * 10,
            ),
            SizedBox(
              height: Dimensions.height30,
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    AccountWidget(
                      appIcon: AppIcon(
                        icon: Icons.person,
                        iconSize: Dimensions.height10 * 5 / 2,
                        backgroundColor: AppColors.mainColor,
                        iconColor: Colors.white,
                        size: Dimensions.height10 * 5,
                      ),
                      bigText: BigText(
                        text: 'Fahar',
                      ),
                    ),
                    SizedBox(
                      height: Dimensions.height20,
                    ),
                    AccountWidget(
                      appIcon: AppIcon(
                        icon: Icons.phone,
                        iconSize: Dimensions.height10 * 5 / 2,
                        backgroundColor: AppColors.yellowColor,
                        iconColor: Colors.white,
                        size: Dimensions.height10 * 5,
                      ),
                      bigText: BigText(
                        text: '923331334503',
                      ),
                    ),
                    SizedBox(
                      height: Dimensions.height20,
                    ),
                    AccountWidget(
                      appIcon: AppIcon(
                        icon: Icons.email,
                        iconSize: Dimensions.height10 * 5 / 2,
                        backgroundColor: AppColors.yellowColor,
                        iconColor: Colors.white,
                        size: Dimensions.height10 * 5,
                      ),
                      bigText: BigText(
                        text: 'faharkhaan@gmail.com',
                      ),
                    ),
                    SizedBox(
                      height: Dimensions.height20,
                    ),
                    AccountWidget(
                      appIcon: AppIcon(
                        icon: Icons.location_on,
                        iconSize: Dimensions.height10 * 5 / 2,
                        backgroundColor: AppColors.yellowColor,
                        iconColor: Colors.white,
                        size: Dimensions.height10 * 5,
                      ),
                      bigText: BigText(
                        text: 'Fill your adress',
                      ),
                    ),
                    SizedBox(
                      height: Dimensions.height20,
                    ),
                    AccountWidget(
                      appIcon: AppIcon(
                        icon: Icons.message_outlined,
                        iconSize: Dimensions.height10 * 5 / 2,
                        backgroundColor: Colors.redAccent,
                        iconColor: Colors.white,
                        size: Dimensions.height10 * 5,
                      ),
                      bigText: BigText(
                        text: 'Fill your adress',
                      ),
                    ),

                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
