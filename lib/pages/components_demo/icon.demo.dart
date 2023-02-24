import 'package:flutter/material.dart';
import 'package:tablet/style/icons.dart';
import 'package:tablet/style/color.dart';

class IconDemo extends StatelessWidget {
  const IconDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Icons 展示'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Wrap(
          spacing: 12.0,
          children: [
            Icon(Icons.add, color: RuColor.green, size: 32),
            RuIcons.svg(
              IconPath.LinedStar,
              color: RuColor.bgPrimary,
              size: 64.0,
            ),
            RuIcons.svg(IconPath.OrderDash, noColor: true),
            RuIcons.svg(IconPath.PaymentVisa, noColor: true),
            RuIcons.svg(IconPath.SolidStar, color: RuColor.green),
            RuIcons.svg(IconPath.SolidStar, size: 64),
            RuIcons.svg(IconPath.TrafficDirect, noColor: true),
          ],
        ),
      ),
    );
  }
}
