import 'package:sizer/sizer.dart';
import 'package:flutter/material.dart';
import 'package:trivia/app_resources/app_strings.dart';
import 'package:trivia/app_resources/app_styles.dart';
import 'package:trivia/models/user_answer_history_model.dart';
import '../database/app_preferences.dart';

class UserHistoryScreen extends StatelessWidget {
  const UserHistoryScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(AppStrings.userHistory),
      ),
      body: FutureBuilder(
          future: AppPreferences().getUserHistory(),
          builder: (context, future) {
            if (future.connectionState == ConnectionState.waiting) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 45.h,
                  ),
                const   CircularProgressIndicator()
                ],
              );
            } else if (future.connectionState == ConnectionState.done) {
              if (future.data == null) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 45.h,
                      width: double.infinity,
                    ),
                    Text(
                      AppStrings.noHistoryAvailable,
                      style: AppStyles.regularRockAndRollTextStyle(
                          fontSize: 10.sp),
                    ),
                  ],
                );
              } else {
                var userAnswers = userAnswerHistoryModelFromJson(future.data!);

                return ListView.builder(
                    itemCount: userAnswers.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        title: Text(userAnswers[index].question.toString()),
                        subtitle: Text(
                            '${AppStrings.answerStatus} ${userAnswers[index].answerGiven}'),
                      );
                    });
              }
            } else {
              return const SizedBox.shrink();
            }
          }),
    );
  }
}
