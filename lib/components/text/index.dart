import 'package:flutter/material.dart';
import 'package:tablet/style/color.dart';

class RText extends StatelessWidget {
  final dynamic text;
  final double? size;
  final bool isBold;
  final FontWeight? weight;
  final Color? color;
  final double? height;
  final bool underline;
  const RText(
    this.text, {
    super.key,
    this.size = 16,
    this.color,
    this.isBold = false,
    this.height = 1,
    this.underline = false,
    this.weight = FontWeight.w400,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text.toString(),
      style: TextStyle(
        fontSize: size,
        color: color ?? RColor.light_common_120,
        fontWeight: isBold ? FontWeight.w700 : weight,
        height: height,
        decoration: underline ? TextDecoration.underline : null,
      ),
    );
  }
}
