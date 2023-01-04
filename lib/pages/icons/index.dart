import 'package:flutter/material.dart';
import 'package:tablet/style/icons.dart';
import 'package:tablet/style/color.dart';

class IconsPage extends StatelessWidget {
  const IconsPage({super.key});

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
            RuIcons.svg('Lined/star', color: RuColor.gray, size: 64.0),
            RuIcons.svg('Order/DoorDash', noColor: true),
            RuIcons.svg('Payment/Visa', noColor: true),
            RuIcons.svg('Solid/star', color: RuColor.green),
            RuIcons.svg('Solid/star', size: 64),
            RuIcons.svg('Traffic/Direct', noColor: true),
          ],
        ),
      ),
    );
  }
}
