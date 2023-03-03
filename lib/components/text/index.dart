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
  final TextAlign? textAlign;
  const RText(
    this.text, {
    super.key,
    this.size = 16,
    this.color = RColor.light_common_120,
    this.isBold = false,
    this.height = 1,
    this.underline = false,
    this.weight = FontWeight.w400,
    this.textAlign,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text.toString(),
      textAlign: textAlign,
      style: TextStyle(
        fontSize: size,
        color: color,
        fontWeight: isBold ? FontWeight.w700 : weight,
        height: height,
        decoration: underline ? TextDecoration.underline : null,
      ),
    );
  }
}
