import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import '../app_resources/app_colors.dart';
import '../app_resources/app_styles.dart';


circleComponent({VoidCallback? onPress, String? title, bool? active}) {
  return Padding(
    padding:  EdgeInsets.only(right:5.w),
    child: InkWell(
      // splashColor: AppColors.secondaryColor,
        onTap: onPress!,
        child: CircleAvatar(
          maxRadius: 5.1.h,
          backgroundColor: AppColors.primaryColor,
          child: Padding(
            padding: EdgeInsets.all(0.1.h),
            child: CircleAvatar(
              maxRadius: 5.h,
              backgroundColor: active! ? AppColors.primaryColor : Colors.white,
              child: Text(
                title!,
                style: AppStyles.boldRockAndRollTextStyle(
                    fontSize: 12.sp,
                    color: active! ? Colors.white : AppColors.primaryColor),
              ),
            ),
          ),
        )),
  );
}