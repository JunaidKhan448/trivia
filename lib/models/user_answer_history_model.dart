// import 'dart:convert';
//
// class UserAnswerHistoryModel{
//
//   String? question;
//   bool? answerGiven;
//
//   UserAnswerHistoryModel({this.question,this.answerGiven});
//
//
//   factory UserAnswerHistoryModel.fromJson(Map<String, dynamic> json){
//     return UserAnswerHistoryModel(
//       question: json['question'],
//       answerGiven: json['answerGiven'],
//     );
//   }
//
//
//   Map<String, dynamic> toJson() => {
//     'question': question,
//     'answerGiven': answerGiven,
//
//   };
//
//   // static String encode(List<UserAnswerHistoryModel> musics) => json.encode(
//   //   musics
//   //       .map<Map<String, dynamic>>((music) => UserAnswerHistoryModel.toJson(music))
//   //       .toList(),
//   // );
//
// }

// To parse this JSON data, do
//
//     final userAnswerHistoryModel = userAnswerHistoryModelFromJson(jsonString);

import 'dart:convert';

List<UserAnswerHistoryModel> userAnswerHistoryModelFromJson(String str) => List<UserAnswerHistoryModel>.from(json.decode(str).map((x) => UserAnswerHistoryModel.fromJson(x)));

String userAnswerHistoryModelToJson(List<UserAnswerHistoryModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class UserAnswerHistoryModel {
  UserAnswerHistoryModel({
    required this.question,
    required this.answerGiven,
  });

  String question;
  bool answerGiven;

  factory UserAnswerHistoryModel.fromJson(Map<String, dynamic> json) => UserAnswerHistoryModel(
    question: json["question"],
    answerGiven: json["answerGiven"],
  );

  Map<String, dynamic> toJson() => {
    "question": question,
    "answerGiven": answerGiven,
  };
}
