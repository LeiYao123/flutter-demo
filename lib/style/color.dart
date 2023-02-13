import 'package:flutter/material.dart';
import 'package:get/get.dart';

// 管理项目中用到的所有颜色
// https://juejin.cn/post/6967727516446359582
class RuColor {
  // 跟随系统模式变化
  static Color get textHeavy =>
      Get.isDarkMode ? const Color(0XFFE9E9E9) : const Color(0XFF121314);
  static Color get textMedium =>
      Get.isDarkMode ? const Color(0XFFA9A9A9) : const Color(0XFF5D6872);
  static Color get textLite =>
      Get.isDarkMode ? const Color(0XFF888888) : const Color(0XFFB0B8BE);
  static Color get textReverse =>
      Get.isDarkMode ? const Color(0XFF000000) : const Color(0XFFFFFFFF);
  static Color get bgAbsolute =>
      Get.isDarkMode ? const Color(0XFF000000) : const Color(0XFFFFFFFF);
  static Color get bgPrimary =>
      Get.isDarkMode ? const Color(0XFF161616) : const Color(0XFFFFFFFF);
  static Color get bgPrimaryElevated =>
      Get.isDarkMode ? const Color(0XFF202020) : const Color(0XFFFFFFFF);
  static Color get bgSecondary =>
      Get.isDarkMode ? const Color(0XFF282828) : const Color(0XFFFAFBFC);
  static Color get bgTertiary =>
      Get.isDarkMode ? const Color(0XFF363636) : const Color(0XFFFAFAFA);
  static Color get bgReverse =>
      Get.isDarkMode ? const Color(0XFFFFFFFF) : const Color(0XFF000000);
  static Color get common_120 =>
      Get.isDarkMode ? const Color(0XFFFFFFFF) : const Color(0XFF000000);
  static Color get common_100 =>
      Get.isDarkMode ? const Color(0XFFE9E9E9) : const Color(0XFF121314);
  static Color get common_64 =>
      Get.isDarkMode ? const Color(0XFFA9A9A9) : const Color(0XFF5D6872);
  static Color get common_32 =>
      Get.isDarkMode ? const Color(0XFF888888) : const Color(0XFFB0B8BE);
  static Color get common_16 =>
      Get.isDarkMode ? const Color(0XFF555555) : const Color(0XFFEBEBEB);
  static Color get common_8 =>
      Get.isDarkMode ? const Color(0XFF404040) : const Color(0XFFE1E5E9);
  static Color get common_4 =>
      Get.isDarkMode ? const Color(0XFF323232) : const Color(0XFFF4F6F8);
  static Color get common_2 =>
      Get.isDarkMode ? const Color(0XFF242424) : const Color(0XFFFAFAFA);

  // 不跟随系统模式变化
  static Color whitePure = const Color(0XFFFFFFFF);
  static Color whiteTransparent = const Color.fromRGBO(255, 255, 255, 0.12);
  static Color blackPure = const Color(0XFF000000);
  static Color blackTransparent = const Color.fromRGBO(0, 0, 0, 0.12);
  static Color green = const Color(0XFF00CA9F);
  static Color greenHeavy = const Color(0XFF00A179);
  static Color greenTransparent = const Color.fromRGBO(0, 202, 159, 0.08);
  static Color blue = const Color(0XFF00A5EB);
  static Color blueHeavy = const Color(0XFF0084C7);
  static Color blueTransparent = const Color.fromRGBO(0, 132, 199, 0.08);
  static Color yellow = const Color(0XFFFFBB08);
  static Color yellowHeavy = const Color(0XFFDCB504);
  static Color yellowTransparent = const Color.fromRGBO(255, 187, 8, 0.08);
  static Color red = const Color(0XFFEF4A41);
  static Color redHeavy = const Color(0XFFCB2628);
  static Color redTransparent = const Color.fromRGBO(239, 74, 65, 0.08);
}
