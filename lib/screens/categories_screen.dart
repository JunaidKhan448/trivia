import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sizer/sizer.dart';
import 'package:trivia/app_resources/app_strings.dart';
import 'package:trivia/app_resources/app_styles.dart';
import 'package:trivia/controller/category_controller.dart';

import '../shimmers/shimmer_for_categories_list.dart';

import 'package:get/get.dart';

import 'categories_list.dart';

class CategoriesScreen extends StatelessWidget {
  CategoriesScreen({Key? key}) : super(key: key);

  CategoryController getCtrl = Get.put(CategoryController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const  Text(AppStrings.selectCategory),
      ),
      body: WillPopScope(
        onWillPop: () async {
          SystemNavigator.pop();
          return true;
        },
        child: Padding(
          padding: AppStyles.appPadding(),
          child: Obx(
            () => getCtrl.dataLoading.value
                ? const ShimmerForCategoriesList()
                : CategoriesList(),
          ),
        ),
      ),
    );
  }
}
