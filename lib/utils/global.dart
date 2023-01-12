import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Global {
  //定义一个全局的
  static late SharedPreferences prefs;
  // 定义全局 navigatorKey
  static final GlobalKey<NavigatorState> navigatorKey = GlobalKey();
  // 获取全局 context
  static BuildContext? get navigatorContext =>
      navigatorKey.currentState?.context;

  // 初始化全局信息，会在APP启动时执行
  static Future init() async {
    WidgetsFlutterBinding.ensureInitialized();
    prefs = await SharedPreferences.getInstance();
  }
}
