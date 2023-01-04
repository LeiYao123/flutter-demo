import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class RuIcons {
  static SvgPicture svg(
    String svgName, {
    bool noColor = false,
    double size = 32,
    Color? color = const Color(0xFF181818),
  }) {
    final String svgPath = "assets/icons/$svgName.svg";
    return SvgPicture.asset(
      svgPath,
      color: noColor ? null : color,
      width: size,
      height: size,
    );
  }
}
