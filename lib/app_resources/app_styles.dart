import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import 'app_colors.dart';
import 'app_constants.dart';
import 'app_fonts.dart';
import 'app_text_sizes.dart';

/// App Styles Class -> Resource class for storing app level styles constants
class AppStyles {
  static EdgeInsets appPadding() => EdgeInsets.only(left: 2.5.h, right: 2.5.h);

  static TextStyle textStyleBold(
      {double? fontSize = AppTextSize.textSizeNormal,
      Color color = AppColors.textColorBlack,
      double? letterSpacing}) {
    return TextStyle(
      color: color,
      letterSpacing: letterSpacing ?? 0,
      fontSize: fontSize,
      fontWeight: FontWeight.w700,
      fontFamily: AppFonts.rockAndRoll,
    );
  }

  static TextStyle regularRockAndRollTextStyle(
      {double? fontSize = AppTextSize.textSizeNormal,
      Color color = AppColors.textColorBlack,
      double? letterSpacing,
      double? height}) {
    return TextStyle(
      color: color,
      letterSpacing: letterSpacing ?? 0,
      fontSize: fontSize?.sp,
      fontWeight: FontWeight.w400,
      fontFamily: AppFonts.rockAndRoll,
      height: height,
    );
  }

  static TextStyle boldRockAndRollTextStyle(
      {double? fontSize = AppTextSize.textSizeNormal,
      Color color = AppColors.textColorBlack,
      double? letterSpacing}) {
    return TextStyle(
      color: color,
      letterSpacing: letterSpacing ?? 0,
      fontSize: fontSize,
      fontWeight: FontWeight.w400,
      fontFamily: AppFonts.rockAndRoll,
    );
  }

  static TextStyle regularSFProTextStyle(
      {double? fontSize = AppTextSize.textSizeNormal,
      Color color = AppColors.textColorBlack,
      double? letterSpacing,
      double? height}) {
    return TextStyle(
      color: color,
      letterSpacing: letterSpacing ?? 0,
      fontSize: fontSize?.sp,
      fontWeight: FontWeight.w400,
      fontFamily: AppFonts.sfPro,
      height: height,
    );
  }

  static TextStyle mediumSFProTextStyle(
      {double? fontSize = AppTextSize.textSizeNormal,
      Color color = AppColors.textColorBlack,
      double? letterSpacing,
      double? height}) {
    return TextStyle(
      color: color,
      letterSpacing: letterSpacing ?? 0,
      fontSize: fontSize?.sp,
      fontWeight: FontWeight.w600,
      fontFamily: AppFonts.sfPro,
      height: height,
    );
  }

  //

  static buttonTextStyle({Color? textColor, double fontSize = 13}) {
    return TextStyle(
        color: textColor ?? AppColors.blueTextColor,
        fontSize: fontSize.sp,
        fontFamily: AppFonts.rockAndRoll,
        fontWeight: FontWeight.w400);
  }

  static buttonStyle({Color? buttonColor}) {
    return ElevatedButton.styleFrom(
      primary: buttonColor ?? AppColors.whiteColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(AppConstants.curvedButtonRadius),
      ),
    );
  }

  static TextStyle dialogueTextStyle() {
    return TextStyle(fontFamily: AppFonts.rockAndRoll, fontSize: 11.sp);
  }

  static TextStyle dialogueHeadingStyle() {
    return TextStyle(
        color: AppColors.whiteColor,
        fontWeight: FontWeight.w400,
        fontFamily: AppFonts.rockAndRoll,
        fontSize: 16.sp);
  }

  static TextStyle termsConditionAndPrivacyPolicyHeadingStyle() {
    return TextStyle(fontWeight: FontWeight.bold, fontSize: 13.sp);
  }

  static BorderRadius appTileBorderRadius() {
    return BorderRadius.circular(8.0);
  }
}
