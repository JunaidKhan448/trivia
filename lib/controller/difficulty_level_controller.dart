import 'package:get/get.dart';
import 'package:trivia/models/diffiulcty_level_model.dart';

class DifficultyLevelController extends GetxController {

  var dataLoading = true.obs;
  var questionTypeSelected='multiple'.obs;
  RxList<DifficultyLevelModel> difficultyLevelList = <DifficultyLevelModel>[
    DifficultyLevelModel(name: 'Easy', selected: true,slug: 'easy'),
    DifficultyLevelModel(name: 'Medium', selected: false,slug: 'medium'),
    DifficultyLevelModel(name: 'Hard', selected: false,slug: 'hard'),
  ].obs;

  @override
  void onInit() {
    // TODO: implement onInit

    Future.delayed(const Duration(seconds: 3), () {
      dataLoading.value = false;
    });
    super.onInit();
  }
}
