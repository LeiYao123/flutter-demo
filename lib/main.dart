import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tablet/routes/index.dart';
import 'package:tablet/style/theme/universal.dart';

void main() {
  runApp(GetMaterialApp(
    debugShowCheckedModeBanner: false,
    initialRoute: '/',
    getPages: appRoutes,
    theme: universal,
    // theme: ThemeData(
    //   primaryColor: const Color(0xFFFFB800),
    //   // primarySwatch: Colors.red,
    // ),
  ));
}
