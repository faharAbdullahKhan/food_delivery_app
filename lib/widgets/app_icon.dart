import 'package:flutter/cupertino.dart';
import 'package:food_delivery/Utilities/dimensions.dart';

class AppIcon extends StatelessWidget {
  final IconData icon;
  final Color backgroundColor;
  final Color iconColor;
  final double size;
  final double iconSize;

  const AppIcon({Key? key,
  required this.icon,
    this.backgroundColor = const Color(0xFFfcf4e4),
    this.size = 40,
    this.iconColor = const Color(0xFF756d54),
    this.iconSize = 16,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        color: backgroundColor,
            borderRadius: BorderRadius.circular(size/2),
      ),
      // decoration: BoxDecoration(
      //   borderRadius: BorderRadius.circular(100 / 2),
      //   color: backgroundColor,
      // ),
      child: Icon(
        icon,
        color: iconColor,
        size: iconSize,
      ),
    );
  }
}
