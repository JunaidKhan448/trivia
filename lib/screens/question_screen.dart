import 'package:flutter/material.dart';
import 'package:trivia/app_resources/app_colors.dart';
import 'package:trivia/app_resources/app_images.dart';
import 'package:trivia/app_resources/app_strings.dart';
import 'package:trivia/controller/questions_controller.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:trivia/screens/user_history_screen.dart';
import 'package:trivia/widgets/answer_widget.dart';
import 'package:trivia/widgets/question_widget.dart';
import '../dialogues/custom_dialogue.dart';
import '../widgets/answer_status_indicator.dart';

class QuestionScreen extends StatelessWidget {
  QuestionScreen({Key? key}) : super(key: key);

  QuestionController getCtrl = Get.put(QuestionController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: appBar(context),
        body: Padding(
            padding: const EdgeInsets.only(
                top: 12.0, bottom: 8.0, right: 12.0, left: 12.0),
            child: Obx(
              () => getCtrl.dataLoading.value
                  ? const Center(
                      child: CircularProgressIndicator(),
                    )
                  : Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ///.................Shows User Answer Status.......................
                        AnswerStatusIndicator(),
                        SizedBox(height: 1.h,),
                        Expanded(
                          flex: 1,
                          child: QuestionWidget(),
                        ),
                        SizedBox(
                          height: 1.h,
                        ),
                        Expanded(
                            flex: 2,
                            child: AnswerWidget(),),
                      ],
                    ),
            )),
      ),
    );
  }








  appBar(BuildContext context){
    return AppBar(
      title: const Text(AppStrings.quiz),
      actions: [
        Padding(
          padding: EdgeInsets.only(right: 4.w),
          child: GestureDetector(
            onTap: () {
              showDialog(
                  context: context,
                  builder: (context) => CustomDialogue(
                      dialogueBoxHeading: AppStrings.dummyName,
                      actionOnHistory: () {
                        Get.back();
                        Get.to(() => UserHistoryScreen());
                      }));
            },
            child: const CircleAvatar(
              backgroundImage: NetworkImage(AppImages.profileImage),
            ),
          ),
        ),
        Container(
            height: 3.h,
            margin: const EdgeInsets.symmetric(vertical: 12.0),
            padding: const EdgeInsets.symmetric(horizontal: 12.0),
            alignment: Alignment.center,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8.0),
                color: AppColors.secondaryColor),
            child: Obx(
                  () => Text('${AppStrings.score} ${getCtrl.liveScore.value}'),
            )),
        const SizedBox(
          width: 12.0,
        )
      ],
    );
  }
}
