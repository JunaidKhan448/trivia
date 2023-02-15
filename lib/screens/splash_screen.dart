import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:trivia/app_resources/app_images.dart';
import 'package:trivia/app_resources/app_strings.dart';
import 'package:trivia/app_resources/app_styles.dart';
import 'package:get/get.dart';
import 'package:trivia/screens/categories_screen.dart';
class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {



  @override
  void initState() {
    // TODO: implement initState

    Future.delayed(const Duration(seconds: 3),(){
      Get.offAll(()=>CategoriesScreen());
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
 
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,

            children: [
              Image.asset(AppImages.splashLogo,scale: 3,),
              Text(AppStrings.trivia,style: AppStyles.regularRockAndRollTextStyle(fontSize: 12.sp),)
            ],
          ),
        ),
      ),
    );
  }
}
