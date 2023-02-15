import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../app_resources/app_styles.dart';

class CustomButton extends StatelessWidget {
  final VoidCallback? onPress;
  final String? text;
  final double buttonHeight;
  final bool paddingStatus;
  final Color? buttonColor;
  final Color? textColor;
  final double textSize;


  const CustomButton({
    this.onPress,
    this.text,
    this.textSize=8.0,
    this.buttonColor,
    this.buttonHeight = 6,
    this.paddingStatus = true,
    this.textColor,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: paddingStatus ? EdgeInsets.symmetric(horizontal: 2.6.h) : const EdgeInsets.all(0.0),
      child: ElevatedButton(
        onPressed: onPress ?? () {},
        style: AppStyles.buttonStyle(buttonColor: buttonColor),
        child: Container(
          height: buttonHeight.h,
          alignment: Alignment.center,
          child: Text(
            text!,
            style: AppStyles.buttonTextStyle(textColor: textColor, fontSize:textSize.sp),
          ),
        ),
      ),
    );
  }
}
