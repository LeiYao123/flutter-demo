import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tablet/store/user.controller.dart';

class Global {
  //定义一个全局的
  static late SharedPreferences prefs;

  // 初始化全局信息，会在APP启动时执行
  static Future init() async {
    WidgetsFlutterBinding.ensureInitialized();
    // 全局初始化 prefs
    prefs = await SharedPreferences.getInstance();
    // 全局初始化 userController
    Get.put(UserController(), permanent: true);
  }
}
