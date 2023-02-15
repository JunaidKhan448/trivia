import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import '../app_resources/app_colors.dart';
import '../app_resources/app_styles.dart';
import '../controller/questions_controller.dart';

class QuestionWidget extends StatelessWidget {

   QuestionWidget({Key? key}) : super(key: key);

  QuestionController getCtrl = Get.put(QuestionController());

  @override
  Widget build(BuildContext context) {

    return Obx(
      ()=> Container(
        width: double.infinity,
        padding: EdgeInsets.all(8.0),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12.0),
            color: AppColors.primaryColor),
        child: Scrollbar(
          //thumbVisibility: true,
          child: SingleChildScrollView(
              physics: ScrollPhysics(),
              child: Text(
                getCtrl
                    .questionModel!
                    .results[getCtrl.currentIndex.value]
                    .question
                    .toString(),
                style:
                AppStyles.regularRockAndRollTextStyle(
                    fontSize: 11.sp,
                    color: Colors.white),
              )),
        ),
      ),
    );
  }
}
