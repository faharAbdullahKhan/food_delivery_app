import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery/Utilities/colors.dart';
import 'package:food_delivery/Utilities/dimensions.dart';
import 'package:food_delivery/widgets/small_text.dart';

class ExpandableTextWidget extends StatefulWidget {
  final String text;
  const ExpandableTextWidget({Key? key, required this.text}) : super(key: key);

  @override
  _ExpandableTextWidgetState createState() => _ExpandableTextWidgetState();
}

class _ExpandableTextWidgetState extends State<ExpandableTextWidget> {
  late String firstHalfOfText;
  late String secondHalfOfText;
  bool hiddenText = true;
  double textHeight = Dimensions.screenHeight/5.63;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    if(widget.text.length > textHeight) {
      firstHalfOfText = widget.text.substring(0 , textHeight.toInt());
      secondHalfOfText = widget.text.substring(textHeight.toInt()+1, widget.text.length);
    }else {
      firstHalfOfText = widget.text;
      secondHalfOfText = "";
    }


  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: secondHalfOfText.isEmpty ? SmallText(height: 1.8, color:AppColors.paraColor ,size:Dimensions.font16,text: firstHalfOfText) : Column(
        children: [
          SmallText(height: 1.8, color:AppColors.paraColor ,text: hiddenText?(firstHalfOfText+ "..."):(firstHalfOfText+secondHalfOfText), size: Dimensions.font16,),
          InkWell(
            onTap: () {

              setState(() {
                hiddenText =! hiddenText;
              });
            },
            child: Row(
              children: [
                SmallText(text: "Show more", color: AppColors.mainColor,),
                hiddenText ? Icon(Icons.arrow_drop_down, color: AppColors.mainColor,) : Icon(Icons.arrow_drop_up, color: AppColors.mainColor,)

              ],
            ),
          ),



        ],
      ),
    );
  }
}
