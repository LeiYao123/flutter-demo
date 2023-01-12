import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:tablet/utils/global.dart';
import 'package:tablet/style/color.dart';

// https://pub.dev/packages/another_flushbar
class Toast {
  static Future<dynamic> successBar(String message, {int duration = 2}) {
    BuildContext context = Global.navigatorContext!;
    return Flushbar(
      message: message,
      duration: Duration(seconds: duration),
      icon: const Icon(Icons.done, color: Colors.white),
      backgroundColor: RuColor.green,
      maxWidth: 400,
      borderRadius: BorderRadius.circular(4),
      flushbarPosition: FlushbarPosition.TOP,
      flushbarStyle: FlushbarStyle.FLOATING,
      margin: const EdgeInsets.only(top: 16),
      padding: const EdgeInsets.all(16),
      isDismissible: true,
    ).show(context);
  }

  static Future<dynamic> errorBar(String message, {int duration = 2}) {
    BuildContext context = Global.navigatorContext!;
    return Flushbar(
      message: message,
      duration: Duration(seconds: duration),
      icon: const Icon(Icons.warning, color: Colors.white),
      backgroundColor: RuColor.red,
      maxWidth: 400,
      borderRadius: BorderRadius.circular(4),
      flushbarPosition: FlushbarPosition.TOP,
      flushbarStyle: FlushbarStyle.FLOATING,
      margin: const EdgeInsets.only(top: 16),
      padding: const EdgeInsets.all(16),
      isDismissible: true,
    ).show(context);
  }

  static Future<dynamic> infoBar(String message, {int duration = 2}) {
    BuildContext context = Global.navigatorContext!;
    return Flushbar(
      message: message,
      duration: Duration(seconds: duration),
      icon: const Icon(Icons.sms, color: Colors.white),
      backgroundColor: RuColor.gray,
      maxWidth: 400,
      borderRadius: BorderRadius.circular(4),
      flushbarPosition: FlushbarPosition.TOP,
      flushbarStyle: FlushbarStyle.FLOATING,
      margin: const EdgeInsets.only(top: 16),
      padding: const EdgeInsets.all(16),
      isDismissible: true,
    ).show(context);
  }
}
