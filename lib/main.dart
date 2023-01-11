import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tablet/routes/index.dart';
import 'package:tablet/style/color.dart';
import 'package:tablet/utils/global.dart';

void main() {
  Global.init().then((v) {
    runApp(GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      getPages: appRoutes,
      theme: customTheme,
    ));
  });
}
