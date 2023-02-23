import 'package:flutter/material.dart';
import 'package:get/get.dart';

// 管理项目中用到的所有颜色
// https://juejin.cn/post/6967727516446359582
class RuColor {
  // 跟随系统模式变化
  static Color get textHeavy =>
      Get.isDarkMode ? const Color(0XFFE9E9E9) : const Color(0XFFE9E9E9);
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

  /// 不跟随系统模式变化
  static const Color whitePure = Color(0XFFFFFFFF);
  static const Color whiteTransparent = Color.fromRGBO(255, 255, 255, 0.12);
  static const Color blackPure = Color(0XFF000000);
  static const Color blackTransparent = Color.fromRGBO(0, 0, 0, 0.12);
  static const Color green = Color(0XFF00CA9F);
  static const Color greenHeavy = Color(0XFF00A179);
  static const Color greenTransparent = Color.fromRGBO(0, 202, 159, 0.08);
  static const Color blue = Color(0XFF00A5EB);
  static const Color blueHeavy = Color(0XFF0084C7);
  static const Color blueTransparent = Color.fromRGBO(0, 132, 199, 0.08);
  static const Color yellow = Color(0XFFFFBB08);
  static const Color yellowHeavy = Color(0XFFDCB504);
  static const Color yellowTransparent = Color.fromRGBO(255, 187, 8, 0.08);
  static const Color red = Color(0XFFEF4A41);
  static const Color redHeavy = Color(0XFFCB2628);
  static const Color redTransparent = Color.fromRGBO(239, 74, 65, 0.08);
}
