import 'package:flutter/material.dart';

// 自定义主题色 https://medium.com/@nickysong/creating-a-custom-color-swatch-in-flutter-554bcdcb27f3
// 自定义 primarySwatch 生成器 http://mcg.mbitson.com/
const int _primaryPrimaryValue = 0xFFFFB800;
const MaterialColor primary = MaterialColor(_primaryPrimaryValue, <int, Color>{
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
});

ThemeData customTheme = ThemeData(
  primaryColor: const Color(_primaryPrimaryValue),
  primarySwatch: primary,

  // useMaterial3: true, 采用 material3 设计规范
  // 去掉 TextButton 的水波纹效果
  // elevatedButtonTheme: const ElevatedButtonThemeData(
  //     style: ButtonStyle(splashFactory: NoSplash.splashFactory)),
);

// 管理项目中用到的所有颜色
class RuColor {
  static const Color white = Colors.white;
  static const Color gray = Color(0xFFCCCCCC);
  static const Color black = Color(0xFF181818);
  static const Color blue = Colors.blue;
  static const Color red = Colors.red;
  static const Color yellow = Color(0xFFFFB800);
  static const Color green = Color.fromRGBO(3, 201, 169, 1);
}
