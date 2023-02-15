import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trivia/database/app_preferences.dart';
import 'package:trivia/models/question_model.dart';
import 'package:trivia/models/user_answer_history_model.dart';

import '../app_resources/map_constants.dart';
import '../components/custom_snackbar.dart';
import '../services/base_client.dart';
import '../utilities/app_url.dart';

class QuestionController extends GetxController {
  var dataLoading = true.obs;

  var difficultyLevel = ''.obs;
  var questionType = ''.obs;
  var currentIndex = 0.obs;
  var liveScore = 0.obs;

  QuestionModel? questionModel;
  RxList<int> answerCount = <int>[].obs;
  RxList<bool> answersGiven = <bool>[].obs;

  RxList<UserAnswerHistoryModel> userHistoryList = <UserAnswerHistoryModel>[].obs;

  @override
  void onInit() {
    // TODO: implement onInit

    AppPreferences().isPreferenceReady;
    hitQuestionsApi();
    super.onInit();
  }

  hitQuestionsApi() async {
    await BaseClient.get(
      NetworkEndpoint.baseUrl, // url
      queryParameters: {
        MapConstants.amount: '10',
      },
      onSuccess: (response) {
        questionModel = QuestionModel.fromJson(response.data);
        questionModel!.results!.forEach((element) {
          element.allAnswers = element.incorrectAnswers;
          element.allAnswers.add(element.correctAnswer);
          answerCount.value =
              List.generate(10, (index) => element.incorrectAnswers.length);
        });

        dataLoading.value = false;
      },

      onError: (error) {
        dataLoading.value = false;
        CustomSnackBar.showCustomErrorToast(
            message: error.message.toString(), title: 'Error');
      }, // error while performing request
    );
  }

  scoreUpdate(String level) {
    if (level == 'easy') {

      liveScore.value++;
    } else if (level == 'medium') {

      liveScore.value = liveScore.value + 2;
    } else {

      liveScore.value = liveScore.value + 3;
    }
  }
}
