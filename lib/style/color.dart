import 'package:flutter/material.dart';

ThemeData customTheme = ThemeData(
  primaryColor: const Color(0xFFFFB800),
  primarySwatch: createMaterialColor(const Color(0xFFFFB800)),
  // 去掉 TextButton 的水波纹效果
  // elevatedButtonTheme: const ElevatedButtonThemeData(
  //     style: ButtonStyle(splashFactory: NoSplash.splashFactory)),
);

// 自定义主题色 https://medium.com/@nickysong/creating-a-custom-color-swatch-in-flutter-554bcdcb27f3
MaterialColor createMaterialColor(Color color) {
  List strengths = <double>[.05];
  Map<int, Color> swatch = {};
  final int r = color.red, g = color.green, b = color.blue;

  for (int i = 1; i < 10; i++) {
    strengths.add(0.1 * i);
  }
  for (var strength in strengths) {
    final double ds = 0.5 - strength;
    swatch[(strength * 1000).round()] = Color.fromRGBO(
      r + ((ds < 0 ? r : (255 - r)) * ds).round(),
      g + ((ds < 0 ? g : (255 - g)) * ds).round(),
      b + ((ds < 0 ? b : (255 - b)) * ds).round(),
      1,
    );
  }
  return MaterialColor(color.value, swatch);
}

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
