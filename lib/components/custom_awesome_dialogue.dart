import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';



customAwesomeDialogue({BuildContext? context,String? score,VoidCallback? onOkPress}){
  return    AwesomeDialog(
    context: context!,
    animType: AnimType.scale,
    dialogType: DialogType.success,
    dismissOnTouchOutside: false,dismissOnBackKeyPress: false,
    title: 'Congratulations',
    desc:
    'You have complete all 10 questions',
    btnOkText:
    'Score: $score',
    btnOkOnPress: onOkPress,
  )..show();
}