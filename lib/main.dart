import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tablet/routes/index.dart';
import 'package:tablet/style/color.dart';
import 'package:tablet/utils/global.dart';

void main() {
  runZonedGuarded(() {
    Global.init().then((v) {
      runApp(GetMaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: '/login',
        getPages: appRoutes,
        theme: customTheme,
        navigatorKey: Global.navigatorKey, // 获取全局context
      ));
    });
  }, ((error, stack) {
    print('error==>$error');
    print('stack==>$stack');
  }));
}
