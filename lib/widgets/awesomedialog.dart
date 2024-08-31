import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';

Future<void> awesome_dialog(BuildContext context,String text)async{
    AwesomeDialog(
                      context: context,
                      dialogType: DialogType.error,
                      animType: AnimType.rightSlide,
                      title: 'Dialog Title',
                      desc:text,
                      btnCancelOnPress: () {},
                      btnOkOnPress: () {},
                    ).show();
}