import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../components/circle_component.dart';
import '../controller/difficulty_level_controller.dart';

class DifficultyLevelList extends StatelessWidget {
  DifficultyLevelList({Key? key}) : super(key: key);

  DifficultyLevelController getCtrl = Get.put(DifficultyLevelController());

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemCount: getCtrl.difficultyLevelList.length,
        itemBuilder: (context, index) {
          return Obx(() => circleComponent(
              onPress: () {
                getCtrl.difficultyLevelList.forEach((element) {
                  element.selected = false;
                });

                getCtrl.difficultyLevelList[index].selected = true;
                getCtrl.difficultyLevelList.refresh();
              },
              title: getCtrl.difficultyLevelList[index].name,
              active: getCtrl.difficultyLevelList[index].selected));
        });
  }
}
