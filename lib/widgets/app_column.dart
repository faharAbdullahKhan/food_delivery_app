import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery/Utilities/colors.dart';
import 'package:food_delivery/Utilities/dimensions.dart';
import 'package:food_delivery/widgets/big_text.dart';
import 'package:food_delivery/widgets/icon_and_text.dart';
import 'package:food_delivery/widgets/small_text.dart';

class AppColumn extends StatelessWidget {

  final String text;

   const AppColumn({Key? key, required this.text }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        BigText(
          text: text,
          size: Dimensions.font20,
        ),
        SizedBox(
          height: Dimensions.height10,
        ),
        //comment section
        Row(
          children: [
            Wrap(
              children: List.generate(
                  5,
                      (index) => Icon(
                    Icons.star,
                    color: AppColors.mainColor,
                    size: 15,
                  )),
            ),
            SizedBox(
              width: 10,
            ),
            SmallText(text: "4.5"),
            SizedBox(
              width: 10,
            ),
            SmallText(text: "1287"),
            SizedBox(
              width: 10,
            ),
            SmallText(
              text: "comments",
            )
          ],
        ),
        SizedBox(
          height: Dimensions.height20,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconAndTextWidget(
                text: "Normal",
                icon: Icons.circle_sharp,
                iconColor: AppColors.iconColor1),
            IconAndTextWidget(
                text: "1.7km",
                icon: Icons.location_on,
                iconColor: AppColors.iconColor1),

            IconAndTextWidget(
                text: "32 min",
                icon: Icons.access_time_rounded,
                iconColor: AppColors.iconColor1),
          ],
        )
      ],
    );
  }
}
