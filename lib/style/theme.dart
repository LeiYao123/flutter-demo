import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tablet/utils/global.dart';
import 'package:tablet/utils/storage.dart';

class AppTheme {
  // 自定义主题色 https://medium.com/@nickysong/creating-a-custom-color-swatch-in-flutter-554bcdcb27f3
  // 自定义 primarySwatch 生成器 http://mcg.mbitson.com/
  static const MaterialColor primary =
      MaterialColor(_primaryPrimaryValue, <int, Color>{
    50: Color(0xFFFFF7E1),
    100: Color(0xFFFFEBB5),
    200: Color(0xFFFFDD84),
    300: Color(0xFFFFCF52),
    400: Color(0xFFFFC52D),
    500: Color(_primaryPrimaryValue),
    600: Color(0xFFFFB507),
    700: Color(0xFFFFAC06),
    800: Color(0xFFFFA404),
    900: Color(0xFFFF9602),
  });
  static const int _primaryPrimaryValue = 0xFFFFBB08;

  static const MaterialColor primaryAccent =
      MaterialColor(_primaryAccentValue, <int, Color>{
    100: Color(0xFFFFFFFF),
    200: Color(_primaryAccentValue),
    400: Color(0xFFFFE2BF),
    700: Color(0xFFFFD6A6),
  });
  static const int _primaryAccentValue = 0xFFFFF9F2;

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
  // style: ButtonStyle(splashFactory: NoSplash.splashFactory)),