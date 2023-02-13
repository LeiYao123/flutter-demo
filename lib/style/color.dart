import 'package:flutter/material.dart';
import 'package:get/get.dart';

// 管理项目中用到的所有颜色
// https://juejin.cn/post/6967727516446359582
class RuColor {
  static Color get white => Get.isDarkMode ? Colors.black12 : Colors.white;
  static Color get gray => Get.isDarkMode ? Colors.black54 : Colors.white;
  static Color get black => Get.isDarkMode ? Colors.red : Colors.black;
  static Color get blue => Get.isDarkMode ? Colors.green : Colors.blue;
  static Color get red => Get.isDarkMode ? Colors.blue : Colors.red;
  static Color get yellow =>
      Get.isDarkMode ? Colors.yellowAccent : const Color(0xFFFFB800);
  static Color get green =>
      Get.isDarkMode ? Colors.red : const Color.fromRGBO(3, 201, 169, 1);
}
