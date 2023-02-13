import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tablet/utils/global.dart';
import 'package:tablet/utils/storage.dart';

class AppTheme {
  // 自定义主题色 https://medium.com/@nickysong/creating-a-custom-color-swatch-in-flutter-554bcdcb27f3
  // 自定义 primarySwatch 生成器 http://mcg.mbitson.com/
  static const int _primaryPrimaryValue = 0xFFFFB800;
  static const MaterialColor primary = MaterialColor(
    _primaryPrimaryValue,
    <int, Color>{
      50: Color(0xFFFFF6E0),
      100: Color(0xFFFFEAB3),
      200: Color(0xFFFFDC80),
      300: Color(0xFFFFCD4D),
      400: Color(0xFFFFC326),
      500: Color(_primaryPrimaryValue),
      600: Color(0xFFFFB100),
      700: Color(0xFFFFA800),
      800: Color(0xFFFFA000),
      900: Color(0xFFFF9100),
    },
  );

  static ThemeData lightTheme = ThemeData(
    primaryColor: const Color(_primaryPrimaryValue),
    primarySwatch: primary,
    brightness: Brightness.light,
  );

  static ThemeData darkTheme = ThemeData(
    primaryColor: const Color(_primaryPrimaryValue),
    primarySwatch: primary,
    brightness: Brightness.dark,
  );

  // 主题模式设置
  // 深色模式： 0 关闭 1 开启 2 跟随系统
  static final _themeMap = {
    0: ThemeMode.light,
    1: ThemeMode.dark,
    2: ThemeMode.system
  };

  static get getThemeMode {
    int mode = Global.prefs.getInt(StorageKey.themeMode) ?? 2;
    return _themeMap[mode];
  }

  ///设置黑暗模式
  static changeThemeMode(int mode) {
    final theme = _themeMap[mode] ?? ThemeMode.system;
    Get.changeThemeMode(theme);
    Global.prefs.setInt(StorageKey.themeMode, mode);
    Future.delayed(const Duration(milliseconds: 250), () {
      Get.forceAppUpdate();
    });
  }
}


  // useMaterial3: true, 采用 material3 设计规范
  // 去掉 TextButton 的水波纹效果
  // elevatedButtonTheme: const ElevatedButtonThemeData(
  //     style: ButtonStyle(splashFactory: NoSplash.splashFactory)),