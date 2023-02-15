// To parse this JSON data, do
//
//     final questionModel = questionModelFromJson(jsonString);

import 'dart:convert';

QuestionModel questionModelFromJson(String str) => QuestionModel.fromJson(json.decode(str));

String questionModelToJson(QuestionModel data) => json.encode(data.toJson());

class QuestionModel {
  QuestionModel({
    required this.responseCode,
    required this.results,
  });

  int responseCode;
  List<Result> results;

  factory QuestionModel.fromJson(Map<String, dynamic> json) => QuestionModel(
    responseCode: json["response_code"],
    results: List<Result>.from(json["results"].map((x) => Result.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "response_code": responseCode,
    "results": List<dynamic>.from(results.map((x) => x.toJson())),
  };
}

class Result {
  Result({
    required this.category,
    required this.type,
    required this.difficulty,
    required this.question,
    required this.correctAnswer,
    required this.incorrectAnswers,
  });

 late String? category;
 late String? type;
 late String? difficulty;
 late String? question;
 late String? correctAnswer;
 late List<String?> incorrectAnswers;
 late List<String?> allAnswers;

  factory Result.fromJson(Map<String, dynamic> json) => Result(
    category: json["category"],
    type: json["type"],
    difficulty: json["difficulty"],
    question: json["question"],
    correctAnswer: json["correct_answer"],
    incorrectAnswers: List<String>.from(json["incorrect_answers"].map((x) => x)),
  );

  Map<String, dynamic> toJson() => {
    "category": category,
    "type": type,
    "difficulty": difficulty,
    "question": question,
    "correct_answer": correctAnswer,
    "incorrect_answers": List<dynamic>.from(incorrectAnswers.map((x) => x)),
  };
}




