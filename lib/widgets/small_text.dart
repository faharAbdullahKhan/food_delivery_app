import 'package:flutter/cupertino.dart';

class SmallText extends StatelessWidget {
  Color? color;
  final String text;
  double size;
  double height;
  TextOverflow overflow;

  SmallText(
      {Key? key,
      this.color = const Color(0xFFccc7c5),
      required this.text,
      this.overflow = TextOverflow.ellipsis,
      this.height = 1.2,
      this.size = 12})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      overflow: overflow,
      maxLines: 50,
      style: TextStyle(
        color: color,
        // fontWeight: FontWeight.w400,
        fontSize: size,
        fontFamily: 'Roboto',
        height: height
      ),
    );
  }
}
