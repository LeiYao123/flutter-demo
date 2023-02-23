import 'package:flutter/material.dart';
import 'package:tablet/components/text/index.dart';
import 'package:tablet/style/color.dart';

class OrderCard extends StatelessWidget {
  final bool isActive;
  final String? tagDesc;
  final String title;
  final String desc;
  final bool isAsap;
  final String? timeDesc;
  final Function()? onTap;
  const OrderCard({
    super.key,
    required this.isActive,
    this.tagDesc,
    required this.title,
    required this.desc,
    required this.isAsap,
    this.timeDesc,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: 120,
        padding: const EdgeInsets.symmetric(horizontal: 24),
        decoration: BoxDecoration(
          color: isActive ? const Color(0xff282828) : const Color(0xff161616),
          border: const Border(
            bottom: BorderSide(color: Color(0xff404040)),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (tagDesc != null) OrderTag(text: tagDesc!),
                if (tagDesc != null) const SizedBox(height: 4),
                RuText(
                  title,
                  size: 24,
                  color: const Color(0xffe9e9e9),
                  weight: FontWeight.w700,
                ),
                const SizedBox(height: 4),
                RuText(
                  desc,
                  size: 16,
                  color: const Color(0xff888888),
                ),
              ],
            ),
            OrderTime(isAsap: isAsap, text: timeDesc),
          ],
        ),
      ),
    );
  }
}

class OrderTag extends StatelessWidget {
  final String text;
  const OrderTag({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return UnconstrainedBox(
      child: Container(
        height: 25,
        padding: const EdgeInsets.symmetric(horizontal: 8),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(24),
          color: const Color(0xff363636),
        ),
        child: RuText(
          text,
          color: RuColor.textHeavy,
          size: 12,
          weight: FontWeight.w700,
        ),
      ),
    );
  }
}

class OrderTime extends StatelessWidget {
  final String? text;
  final bool isAsap;
  const OrderTime({super.key, this.text, required this.isAsap});

  @override
  Widget build(BuildContext context) {
    final color = isAsap ? const Color(0xffe9e9e9) : const Color(0xffFFBB08);
    final desc = isAsap ? 'ASAP' : text;
    return UnconstrainedBox(
      child: Container(
        width: 96,
        height: 38,
        padding: const EdgeInsets.symmetric(horizontal: 8),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: const Color(0xff404040)),
        ),
        child: RuText(desc, color: color),
      ),
    );
  }
}
