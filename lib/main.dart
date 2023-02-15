import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:trivia/app_resources/app_colors.dart';
import 'package:trivia/app_resources/app_strings.dart';
import 'package:trivia/screens/splash_screen.dart';
import 'package:get/get.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
return Sizer(
    builder: (context, orientation, deviceType) {
      return
        GetMaterialApp(
          title: AppStrings.appName,
          theme: ThemeData(
            scaffoldBackgroundColor: Colors.white,
              primarySwatch: Colors.blue,
          appBarTheme: AppBarTheme(
            color: AppColors.primaryColor,
          )
          ),
          debugShowCheckedModeBanner: false,
          home: const SplashScreen(),

          builder: (BuildContext context, Widget? child) {
            return MediaQuery(
              data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0, boldText: false),
              child: child!,
            );
          },
        );

    });
  }
}



