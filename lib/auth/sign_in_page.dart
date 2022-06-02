import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery/Utilities/colors.dart';
import 'package:food_delivery/Utilities/dimensions.dart';
import 'package:food_delivery/auth/sign_up_page.dart';
import 'package:food_delivery/base/show_custom_snackbar.dart';
import 'package:food_delivery/controller/auth_controller.dart';
import 'package:food_delivery/pages/home/home_page.dart';
import 'package:food_delivery/routes/route_helper.dart';
import 'package:food_delivery/widgets/app_text_field.dart';
import 'package:food_delivery/widgets/big_text.dart';
import 'package:food_delivery/widgets/small_text.dart';
import 'package:get/get.dart';

class SignInPage extends StatelessWidget {
  const SignInPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var passwordController = TextEditingController();
    var emailController = TextEditingController();

    void _login(AuthController authController) {

      // var authController = Get.find<AuthController>();

      String password = passwordController.text.trim();
      String email = emailController.text.trim();

      if (password.isEmpty) {
        ShowCustomSnackBar("Type in your password", title: "Password");
      } else if (email.isEmpty) {
        ShowCustomSnackBar("Type in your email", title: "Email");
      } else if (!GetUtils.isEmail(email)) {
        ShowCustomSnackBar("Type in a valid email address",
            title: "Invalid Email");
      }else if (password.length < 6) {
        ShowCustomSnackBar("Password cannot be less than 6 ",
            title: "Invalid Password");
      } else {
        ShowCustomSnackBar("All went well", title: "Perfect");
           authController.login( email, password).then((status) {
          if(status.isSuccess) {
            print("Success Registration");
            Get.toNamed(RouteHelper.getCartPage());
          }else{
            ShowCustomSnackBar(status.message);
          }


        });
      }
    }


    return Scaffold(
      backgroundColor: Colors.white,
      body: GetBuilder<AuthController>(builder: (authController) {
        return !authController.isLoading ? SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            children: [
              SizedBox(
                height: Dimensions.screenHeight * 0.05,
              ),
              // app logo
              Container(
                height: Dimensions.screenHeight * 0.25,
                child: const Center(
                  child: CircleAvatar(
                    radius: 80,
                    backgroundImage:
                    AssetImage("assets/images/restaurant-28_generated.jpg"),
                    backgroundColor: Colors.white,
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.only(left: Dimensions.width20),
                child: Column(
                  children: [
                    // Hello text
                    Container(
                      margin: EdgeInsets.only(left: Dimensions.width30+Dimensions.width15),
                      width: double.maxFinite,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Hello ",
                            style: TextStyle(
                                fontSize:
                                Dimensions.font20 * 3 + Dimensions.font20 / 2,
                                fontWeight: FontWeight.bold),
                          ),
                          SmallText(
                            text: "Sign in to your account",
                            size: 20,
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: Dimensions.height30,
                    ),
                    // phone text field
                    AppTextField(
                        textController: emailController,
                        icon: Icons.email,
                        hintText: "Email"),
                    SizedBox(
                      height: Dimensions.height30,
                    ),
                    // Password text field
                    AppTextField(
                        textController: passwordController,
                        icon: Icons.password_sharp, isObscure: true,
                        hintText: "Password"),
                    SizedBox(
                      height: Dimensions.height20,
                    ),

                    // Sign in to your account text
                    Container(
                      margin: EdgeInsets.only(right: Dimensions.width30),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          RichText(
                              text: TextSpan(
                                  text: "Sign into your account",
                                  style: TextStyle(
                                      color: Colors.grey[500],
                                      fontSize: Dimensions.font20))),
                        ],
                      ),
                    ),

                    SizedBox(
                      height: Dimensions.screenHeight * 0.04,
                    ),

                    //Sign in button
                    GestureDetector(
                      onTap: () {
                        Get.toNamed(RouteHelper.getCartPage());

                        _login(authController);
                        // Get.toNamed(RouteHelper.getInitial());

                        // Get.to(() => const HomePage());
                      },
                      child: Container(
                        width: Dimensions.screenWidth / 2,
                        height: Dimensions.screenHeight / 13,
                        decoration: BoxDecoration(
                            borderRadius:
                            BorderRadius.circular(Dimensions.radius30),
                            color: AppColors.mainColor),
                        child: Center(
                            child: BigText(
                              text: "Sign in",
                              size: Dimensions.font20 + Dimensions.font20 / 2,
                              color: Colors.white,
                            )),
                      ),
                    ),
                    SizedBox(
                      height: Dimensions.screenHeight * 0.09,
                    ),

                    RichText(
                      text: TextSpan(
                          text: "Don\'t have an account?",
                          style: TextStyle(
                              color: Colors.grey[500],
                              fontSize: Dimensions.font20),
                          children: [
                            TextSpan(
                                recognizer: TapGestureRecognizer()..onTap=()=> Get.to(() => const SignUpPage(), transition: Transition.fade) ,
                                text: " Create",
                                style: TextStyle(
                                    color: AppColors.mainBlackColor,
                                    fontSize: Dimensions.font20,
                                    fontWeight: FontWeight.bold
                                )
                            )
                          ]
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ): CustomScrollView();
      },),
    );
  }
}
