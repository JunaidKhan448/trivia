import 'package:get/get.dart';
import 'package:trivia/database/app_preferences.dart';


class CategoryController extends GetxController{

  var dataLoading=true.obs;

  @override
  void onInit() {
    // TODO: implement onInit
// AppPreferences().
    Future.delayed(Duration(seconds: 3),(){
    //  Get.offAll(()=>CategoriesScreen());
   dataLoading.value=false;

    });
    super.onInit();
  }





}