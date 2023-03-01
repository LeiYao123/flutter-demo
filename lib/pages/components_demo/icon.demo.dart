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
            const Icon(Icons.add, color: RuColor.green, size: 32),
            RuIcons(IconPath.LinedStar, color: RuColor.common_120, size: 64.0),
            RuIcons(IconPath.OrderDash),
            RuIcons(IconPath.PaymentVisa),
            RuIcons(IconPath.SolidStar, color: RuColor.green),
            RuIcons(IconPath.SolidStar, size: 64, color: Colors.red),
            RuIcons(IconPath.TrafficDirect),
            RuIcons(IconPath.checked_false, size: 20),
            RuIcons(IconPath.checked_true, size: 20),
            RuIcons(IconPath.checked_true, size: 60),
          ],
        ),
      ),
    );
  }
}
