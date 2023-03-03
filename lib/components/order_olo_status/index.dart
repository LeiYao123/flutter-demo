import 'package:flutter/material.dart';
import 'package:tablet/components/button/index.dart';
import 'package:tablet/components/text/index.dart';
import 'package:tablet/style/color.dart';
import 'package:tablet/style/icons.dart';

class OrderOLOStatus extends StatelessWidget {
  final bool isOpen;
  final String time;
  final Function()? onPressed;
  const OrderOLOStatus({
    super.key,
    required this.isOpen,
    required this.time,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    final title = isOpen ? 'Store Open' : 'Store Closed';
    final desc =
        isOpen ? 'Accepting orders until $time' : 'Next opening: $time';
    return Container(
      color: RColor.dark_bg_primary,
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 21),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              RText(
                title,
                weight: FontWeight.w700,
                size: 20,
                color: isOpen ? RColor.green : RColor.red,
              ),
              const SizedBox(height: 4),
              RText(desc, size: 16, color: RColor.dark_text_lite),
            ],
          ),
          RIconButton(
            icon: RIcons(IconPath.adjustments, size: 24),
            bgColor: RColor.white_t,
            onPressed: onPressed,
          ),
        ],
      ),
    );
  }
}
