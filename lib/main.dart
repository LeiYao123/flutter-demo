import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tablet/routes/index.dart';
import 'package:tablet/style/theme/color.dart';

void main() {
  runApp(GetMaterialApp(
    debugShowCheckedModeBanner: false,
    initialRoute: '/',
    getPages: appRoutes,
    theme: universal,
  ));
}
