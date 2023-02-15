import 'package:flutter/material.dart';
import 'package:trivia/app_resources/app_strings.dart';
import 'package:trivia/app_resources/app_styles.dart';
import 'package:sizer/sizer.dart';
import 'package:get/get.dart';
import 'package:trivia/components/custom_snackbar.dart';
import 'package:trivia/screens/question_screen.dart';
import 'package:trivia/widgets/difficulty_level_list.dart';
import '../app_resources/app_colors.dart';
import '../app_resources/app_images.dart';
import '../components/circle_component.dart';
import '../controller/difficulty_level_controller.dart';
import '../utilities/util.dart';
import '../widgets/custom_button.dart';

class DifficultyLevelScreen extends StatelessWidget {
  DifficultyLevelScreen({Key? key}) : super(key: key);

  DifficultyLevelController getCtrl = Get.put(DifficultyLevelController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(AppStrings.pleaseChoose),
      ),
      body: Padding(
        padding: AppStyles.appPadding() + const EdgeInsets.only(top: 8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 2.h,
            ),
            Text(
              AppStrings.selectDifficultLevel,
              style: AppStyles.regularSFProTextStyle(fontSize: 10.sp),
            ),
            SizedBox(
              height: 2.h,
            ),
            Container(
              height: 10.h,
              width: double.infinity,
              child: DifficultyLevelList(),
            ),
            SizedBox(
              height: 5.h,
            ),
            Text(
              AppStrings.selectTypeQuestions,
              style: AppStyles.regularSFProTextStyle(fontSize: 10.sp),
            ),
            Obx(() => ListTile(
                onTap: () {
                  getCtrl.questionTypeSelected.value = 'multiple';
                },
                leading: Container(
                  height: 30,
                  width: 30,
                  padding: const EdgeInsets.all(6.0),
                  child: Image.asset(
                      getCtrl.questionTypeSelected.value == 'multiple'
                          ? AppImages.activeRadioButton
                          : AppImages.inactiveRadioButton),
                ),
                title: Text(
                 AppStrings.multipleQuestions,
                  style: AppStyles.regularSFProTextStyle(fontSize: 10.sp),
                ))),
            Obx(
              () => ListTile(
                  onTap: () {
                    getCtrl.questionTypeSelected.value = 'boolean';
                  },
                  leading: Container(
                    height: 30,
                    width: 30,
                    padding: const EdgeInsets.all(6.0),
                    child: Image.asset(
                        getCtrl.questionTypeSelected.value == 'boolean'
                            ? AppImages.activeRadioButton
                            : AppImages.inactiveRadioButton),
                  ),
                  title: Text(
                    'True/False',
                    style: AppStyles.regularSFProTextStyle(fontSize: 10.sp),
                  )),
            ),
            SizedBox(
              height: 5.h,
            ),
            CustomButton(
              text: AppStrings.Continue,
              buttonColor: AppColors.primaryColor,
              textColor: AppColors.whiteColor,
              textSize: 10.sp,
              onPress: () {

                ///......Check Internet Status to Proceed For Api Call.....
                Util.check().then((value) {
                  if (value == true) {
                    Get.to(() => QuestionScreen());
                  } else {
                    CustomSnackBar.showCustomErrorToast(
                        message: AppStrings.chooseInternetToProceed);
                  }
                });
                // Get.to(()=>QuestionScreen());
                // validate();
              },
            ),
          ],
        ),
      ),
    );
  }
}
