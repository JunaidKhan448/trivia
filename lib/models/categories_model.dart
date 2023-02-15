// import 'dart:convert';
//
// CategoriesModel categoriesModelFromJson(String str) => CategoriesModel.fromJson(json.decode(str));
//
// String categoriesModelToJson(CategoriesModel data) => json.encode(data.toJson());
//
// class CategoriesModel {
//   CategoriesModel({
//     required this.triviaCategories,
//   });
//
//   List<TriviaCategory> triviaCategories;
//
//   factory CategoriesModel.fromJson(Map<String, dynamic> json) => CategoriesModel(
//     triviaCategories: List<TriviaCategory>.from(json["trivia_categories"].map((x) => TriviaCategory.fromJson(x))),
//   );
//
//   Map<String, dynamic> toJson() => {
//     "trivia_categories": List<dynamic>.from(triviaCategories.map((x) => x.toJson())),
//   };
// }
//
// class TriviaCategory {
//   TriviaCategory({
//     required this.id,
//     required this.name,
//   });
//
//   int id;
//   String name;
//
//   factory TriviaCategory.fromJson(Map<String, dynamic> json) => TriviaCategory(
//     id: json["id"],
//     name: json["name"],
//   );
//
//   Map<String, dynamic> toJson() => {
//     "id": id,
//     "name": name,
//   };
// }

class CategoryModel {
  String? name;

  CategoryModel({this.name});
}
