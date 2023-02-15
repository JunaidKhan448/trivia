import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:get/get.dart';
import 'package:trivia/app_resources/app_colors.dart';
import 'package:trivia/app_resources/app_styles.dart';
import 'package:trivia/screens/difficulty_level_screen.dart';

categoriesTile(String name,{VoidCallback? onPress}) {
  return InkWell(
    splashColor: AppColors.secondaryColor,
    onTap: onPress??() {
      Get.to(() =>  DifficultyLevelScreen());
    },
    child: Container(
      height: 10.h,
      margin:const EdgeInsets.only(bottom: 8.0),
      width: double.infinity,
      padding: const EdgeInsets.only(left: 8.0),
      decoration: BoxDecoration(
          border: Border.all(color: Colors.black),
          borderRadius: AppStyles.appTileBorderRadius()),
      alignment: Alignment.centerLeft,
      child: Text(
        name,
        style: AppStyles.regularSFProTextStyle(fontSize: 10.sp),
      ),
    ),
  );
}
