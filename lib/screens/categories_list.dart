import 'package:flutter/material.dart';
import 'package:trivia/components/categories_tile.dart';
import 'package:trivia/models/categories_model.dart';

class CategoriesList extends StatelessWidget {
  final List<CategoryModel?> categoriesList = [
    CategoryModel(name: 'General Knowledge'),
    CategoryModel(name: 'Comics'),
    CategoryModel(name: 'Mythology'),
    CategoryModel(name: 'Sports'),
    CategoryModel(name: 'Geography'),
    CategoryModel(name: 'History'),
    CategoryModel(name: 'Politics'),
    CategoryModel(name: 'Art'),
    CategoryModel(name: 'Celebrities'),
    CategoryModel(name: 'Animals'),
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: categoriesList.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: EdgeInsets.only(top: index == 0 ? 8.0 : 0.0),
            child: categoriesTile(categoriesList[index]!.name!),
          );
        });
  }
}
