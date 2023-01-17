import 'package:flutter/material.dart';
import 'package:tablet/style/color.dart';

class RuText extends StatelessWidget {
  final dynamic text;
  final double? size;
  final bool isBold;
  final FontWeight? weight;
  final Color? color;
  final double? height;
  final bool underline;
  const RuText(
    this.text, {
    super.key,
    this.size = 16,
    this.color = RuColor.black,
    this.isBold = false,
    this.height = 1,
    this.underline = false,
    this.weight,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text.toString(),
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
