import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tablet/routes/index.dart';
import 'package:tablet/style/theme.dart';
import 'package:tablet/utils/config.dart';
import 'package:tablet/utils/global.dart';

void main() {
  Global.init().then((v) {
    runApp(GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: APP_NAME,
      // initialRoute: '/home',
      initialRoute: AppRoutes.componentsDemo,
      getPages: AppRoutes.getRoutes,
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: AppTheme.getThemeMode,
    ));
  });
}
