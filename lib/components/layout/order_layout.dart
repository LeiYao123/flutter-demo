import 'package:flutter/material.dart';
import 'package:collection/collection.dart';
import 'package:tablet/components/text/index.dart';
import 'package:tablet/style/color.dart';
import 'package:tablet/style/icons.dart';

class OrderLayout extends StatelessWidget {
  final int pageIndex;
  final Widget pageView;
  final List<Widget> pageNavs;
  final Function(int) onChanged;
  const OrderLayout({
    super.key,
    required this.pageIndex,
    required this.pageView,
    required this.onChanged,
    required this.pageNavs,
  });

  List<Widget> _getNavs() {
    return pageNavs.mapIndexed((idx, el) {
      final isActive = pageIndex == idx;
      return Expanded(
        child: Container(
          color: isActive ? const Color(0xff282828) : const Color(0XFF161616),
          margin: EdgeInsets.only(bottom: idx == pageNavs.length ? 0 : 8),
          child: InkWell(
            child: el,
            onTap: () => onChanged(idx),
          ),
        ),
      );
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: 80,
          color: RuColor.common_120,
          padding: const EdgeInsets.all(8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 24, bottom: 32),
                child: RuIcons.svg(
                  IconPath.menu,
                  size: 32,
                  color: RuColor.whitePure,
                ),
              ),
              ..._getNavs()
            ],
          ),
        ),
        Expanded(child: pageView)
      ],
    );
  }
}

class NavItem extends StatelessWidget {
  final bool? isActive;
  final String icon;
  final String label;
  const NavItem({
    super.key,
    required this.icon,
    required this.label,
    this.isActive = false,
  });

  @override
  Widget build(BuildContext context) {
    final iconColor =
        isActive! ? const Color(0xffffffff) : const Color(0xff404040);
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        RuIcons.svg(icon, color: iconColor),
        const SizedBox(height: 4),
        RuText(label, color: RuColor.yellow, weight: FontWeight.w700),
      ],
    );
  }
}
