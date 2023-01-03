import 'package:flutter/material.dart';

ThemeData universal = ThemeData(
  primarySwatch: primarySwatch,
  // primarySwatch: Colors.blue,
  primaryColor: const Color(0xFFFFB800),
);

class RColor {
  static Color white = Colors.white;
  static Color gray = const Color(0xFFCCCCCC);
  static Color blue = Colors.blue;
  static Color green = const Color.fromRGBO(3, 201, 169, 1);
}

// 自定义主题色
final MaterialColor primarySwatch =
    MaterialColor(const Color(0xFFFFB800).value, swatchify());
Map<int, Color> swatchify() {
  return {
    50: const Color(0xFFFFB800),
    100: const Color(0xFFFFB800),
    200: const Color(0xFFFFB800),
    300: const Color(0xFFFFB800),
    400: const Color(0xFFFFB800),
    500: const Color(0xFFFFB800),
    600: const Color(0xFFFFB800),
    700: const Color(0xFFFFB800),
    800: const Color(0xFFFFB800),
    900: const Color(0xFFFFB800),
  };
}
