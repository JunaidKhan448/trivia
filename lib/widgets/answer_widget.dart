import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../components/categories_tile.dart';
import '../components/custom_awesome_dialogue.dart';
import '../controller/questions_controller.dart';
import '../database/app_preferences.dart';
import '../models/user_answer_history_model.dart';
import '../screens/categories_screen.dart';

class AnswerWidget extends StatelessWidget {
  AnswerWidget({Key? key}) : super(key: key);

  QuestionController getCtrl = Get.put(QuestionController());

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => ListView.builder(
          itemCount: getCtrl.questionModel!.results[getCtrl.currentIndex.value]
              .incorrectAnswers.length,
          itemBuilder: (context, index) {
            var baseValue =
                getCtrl.questionModel!.results[getCtrl.currentIndex.value];
            var options = baseValue.allAnswers[index]!;
            var correctAnswer = baseValue.correctAnswer;
            return Padding(
              padding: EdgeInsets.only(top: index == 0 ? 8.0 : 0.0),
              child: categoriesTile(options, onPress: () {
                ///...................If its the last/10th question.............................
                if (getCtrl.currentIndex.value == 9) {
                  getCtrl.userHistoryList.add(UserAnswerHistoryModel(
                      question: getCtrl.questionModel!
                          .results[getCtrl.currentIndex.value].question
                          .toString(),
                      answerGiven: correctAnswer == options ? true : false));
              //...................showCompletionDialogue.................
                  customAwesomeDialogue(
                      context: context,
                      score: getCtrl.liveScore.value.toString(),
                      onOkPress: () {
                        AppPreferences().setUserHistory(
                            userHistoryList:
                                jsonEncode(getCtrl.userHistoryList.value));
                        Get.offAll(() => CategoriesScreen());
                      });

                  if (correctAnswer == options) {
                    getCtrl.answersGiven.add(true);
                    getCtrl.answersGiven.refresh();

                    ///....update score..............
                    getCtrl.scoreUpdate(baseValue.difficulty!);
                  } else {
                    getCtrl.answersGiven.add(false);
                    getCtrl.answersGiven.refresh();
                  }
                }



                else {
                  getCtrl.userHistoryList.add(UserAnswerHistoryModel(
                      question: getCtrl.questionModel!
                          .results[getCtrl.currentIndex.value].question
                          .toString(),
                      answerGiven: correctAnswer == options ? true : false));

                  if (correctAnswer == options) {
                    getCtrl.answersGiven.add(true);
                    getCtrl.currentIndex++;
                    getCtrl.answersGiven.refresh();

                    ///....update score
                    getCtrl.scoreUpdate(baseValue.difficulty!);
                  } else {
                    getCtrl.answersGiven.add(false);
                    getCtrl.currentIndex++;
                    getCtrl.answersGiven.refresh();
                  }
                }
              }),
            );
          }),
    );
  }
}
