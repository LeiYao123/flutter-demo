import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class IconPath {
  static const LinedStar = "assets/icons/Lined/star.svg";
  static const OrderDash = "assets/icons/Order/DoorDash.svg";
  static const PaymentVisa = "assets/icons/Payment/Visa.svg";
  static const SolidStar = "assets/icons/Solid/star.svg";
  static const TrafficDirect = "assets/icons/Traffic/Direct.svg";
}

class RuIcons {
  static SvgPicture svg(
    String svgName, {
    bool noColor = false,
    double size = 24,
    Color? color = const Color(0xFF181818),
  }) {
    return SvgPicture.asset(
      svgName,
      color: noColor ? null : color,
      width: size,
      height: size,
    );
  }
}
