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
            const Icon(Icons.add, color: RColor.green, size: 32),
            RIcons(IconPath.LinedStar,
                color: RColor.light_common_120, size: 64.0),
            RIcons(IconPath.OrderDash),
            RIcons(IconPath.PaymentVisa),
            RIcons(IconPath.SolidStar, color: RColor.green),
            RIcons(IconPath.SolidStar, size: 64, color: Colors.red),
            RIcons(IconPath.TrafficDirect),
            RIcons(IconPath.checked_false, size: 20),
            RIcons(IconPath.checked_true, size: 20),
            RIcons(IconPath.checked_true, size: 60),
          ],
        ),
      ),
    );
  }
}
