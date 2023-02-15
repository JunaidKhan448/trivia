
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../app_resources/app_colors.dart';
import '../app_resources/app_constants.dart';
import '../app_resources/app_styles.dart';
import '../widgets/custom_button.dart';

class CustomDialogue extends StatelessWidget {
  final String dialogueBoxHeading;


  final VoidCallback actionOnHistory;

  const CustomDialogue({Key? key, required this.dialogueBoxHeading,required this.actionOnHistory,})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(AppConstants.dialogueBoxCurveRadius)),
      child: Container(
        height: AppConstants.dialogueBoxHeight.h,

        child: Column(
          children: [
            Container(
              height: 6.h,
              alignment: Alignment.center,
              width: double.infinity,
              decoration: const BoxDecoration(
                  borderRadius: BorderRadius.vertical(top: Radius.circular(AppConstants.dialogueBoxCurveRadius)), color: AppColors.secondaryColor),
              child: Text(
                dialogueBoxHeading,
                style: AppStyles.dialogueHeadingStyle(),
              ),
            ),
        Spacer(),
            Padding(
              padding: EdgeInsets.only(left: 12.0,right: 12.0,top: 12.0,bottom: 3.h),
              child: CustomButton(

                paddingStatus: false,
                textColor: AppColors.whiteColor,
                text: 'Recent History',
                onPress: actionOnHistory,
                buttonHeight: 6,
                buttonColor: AppColors.primaryColor,
              ),
            )
          ],
        ),
      ),
    );
  }
}
