import 'package:flutter/material.dart';

ThemeData universal = ThemeData(
  // the reason why I dont use primary swatch
  // https://medium.com/@filipvk/creating-a-custom-color-swatch-in-flutter-554bcdcb27f3
  // primarySwatch: Colors.black,
  // fontFamily: 'Open Sans',
  visualDensity: VisualDensity.adaptivePlatformDensity,
  indicatorColor: RColor.blue,
  cardTheme: CardTheme(
    elevation: 0,
    color: RColor.white,
    shape: RoundedRectangleBorder(
      borderRadius: const BorderRadius.all(Radius.circular(2)),
      side: BorderSide(width: 1, color: RColor.gray),
    ),
  ),
);

class RColor {
  static Color white = Colors.white;
  static Color gray = const Color(0xFFCCCCCC);
  static Color blue = Colors.blue;
  static Color green = const Color.fromRGBO(3, 201, 169, 1);
}
