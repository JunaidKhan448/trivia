import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trivia/controller/questions_controller.dart';

import '../app_resources/app_colors.dart';

class AnswerStatusIndicator extends StatelessWidget {
   AnswerStatusIndicator({Key? key}) : super(key: key);

  QuestionController getCtrl = Get.put(QuestionController());

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Wrap(
        children: List.generate(
            getCtrl.answersGiven.value.length,
            (index) => Icon(
                  getCtrl.answersGiven[index] == true
                      ? Icons.check_circle
                      : Icons.cancel,
                  color: getCtrl.answersGiven[index] == true
                      ? AppColors.secondaryColor
                      : Colors.red,
                )),
      ),
    );
  }
}
