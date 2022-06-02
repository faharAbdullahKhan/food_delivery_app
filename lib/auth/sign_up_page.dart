import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery/Utilities/colors.dart';
import 'package:food_delivery/Utilities/dimensions.dart';
import 'package:food_delivery/base/custom_loader.dart';
import 'package:food_delivery/base/show_custom_snackbar.dart';
import 'package:food_delivery/controller/auth_controller.dart';
import 'package:food_delivery/models/sign_up_body_model.dart';
import 'package:food_delivery/widgets/app_text_field.dart';
import 'package:food_delivery/widgets/big_text.dart';
import 'package:get/get.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var emailController = TextEditingController();
    var passwordController = TextEditingController();
    var nameController = TextEditingController();
    var phoneController = TextEditingController();

    var signUpImages = ["t.png", "f.png", "g.png"];

    void _registration(AuthController authController) {

      // var authController = Get.find<AuthController>();

      String name = nameController.text.trim();
      String password = passwordController.text.trim();
      String email = emailController.text.trim();
      String phone = phoneController.text.trim();

      if (name.isEmpty) {
        ShowCustomSnackBar("Type in your name", title: "Name");
      } else if (password.isEmpty) {
        ShowCustomSnackBar("Type in your password", title: "Password");
      } else if (email.isEmpty) {
        ShowCustomSnackBar("Type in your email", title: "Email");
      } else if (!GetUtils.isEmail(email)) {
        ShowCustomSnackBar("Type in a valid email address",
            title: "Invalid Email");
      } else if (phone.isEmpty) {
        ShowCustomSnackBar("Type in your phone number", title: "Phone number");
      } else if (password.length < 6) {
        ShowCustomSnackBar("Password cannot be less than 6 ",
            title: "Invalid Password");
      } else {
        ShowCustomSnackBar("All went well", title: "Perfect");
        SignUpBody signUpBody = SignUpBody(
            name: name, password: password, email: email, phone: phone);
        print(signUpBody.toString());

        authController.registration(signUpBody).then((status) {
          if(status.isSuccess) {
            print("Success Registration");
          }else{
            ShowCustomSnackBar(status.message);
          }


        });
      }
    }

    return Scaffold(
      backgroundColor: Colors.white,
      body: GetBuilder<AuthController>(builder: (authController){
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
              //Email
              AppTextField(
                  textController: emailController,
                  icon: Icons.email,
                  hintText: "Email"),
              SizedBox(
                height: Dimensions.height20,
              ),
              //Password
              AppTextField(
                  textController: passwordController,
                  icon: Icons.password_sharp, isObscure: true,
                  hintText: "Password"),
              SizedBox(
                height: Dimensions.height20,
              ),
              //Name
              AppTextField(
                  textController: nameController,
                  icon: Icons.person,
                  hintText: "Name"),
              SizedBox(
                height: Dimensions.height20,
              ),
              //phone
              AppTextField(
                  textController: phoneController,
                  icon: Icons.phone,
                  hintText: "Phone"),
              SizedBox(
                height: Dimensions.height30,
              ),

              //TODO: Sign up button
              GestureDetector(
                onTap: () {
                  _registration(authController);
                },
                child: Container(
                  width: Dimensions.screenWidth / 2,
                  height: Dimensions.screenHeight / 13,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(Dimensions.radius30),
                      color: AppColors.mainColor),
                  child: Center(
                      child: BigText(
                        text: "Sign up",
                        size: Dimensions.font20 + Dimensions.font20 / 2,
                        color: Colors.white,
                      )),
                ),
              ),
              SizedBox(
                height: Dimensions.height10,
              ),
              //Tag line
              RichText(
                  text: TextSpan(
                      recognizer: TapGestureRecognizer()
                        ..onTap = () => Get.back(),
                      text: "Have an account already?",
                      style: TextStyle(
                          color: Colors.grey[500], fontSize: Dimensions.font20))),
              SizedBox(
                height: Dimensions.screenHeight * 0.05,
              ),

              //Signup options
              RichText(
                  text: TextSpan(
                      text: "Sign up using the following methods",
                      style: TextStyle(
                          color: Colors.grey[500], fontSize: Dimensions.font16))),

              Wrap(
                // direction: Axis.vertical,
                children: List.generate(
                  3,
                      (index) => Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: CircleAvatar(
                      backgroundColor: Colors.white,
                      radius: Dimensions.radius30,
                      backgroundImage: AssetImage(
                        "assets/images/" + signUpImages[index],
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ) : const CustomLoader();
      },),
    );
  }
}
