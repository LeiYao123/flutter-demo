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
          color: isActive ? RColor.dark_bg_secondary : RColor.dark_bg_primary,
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
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Container(
          width: 80,
          color: RColor.dark_bg_absolute,
          padding: const EdgeInsets.all(8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 24, bottom: 32),
                child: RIcons(
                  IconPath.menu,
                  size: 32,
                  color: RColor.dark_common_120,
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
    final iconColor = isActive! ? RColor.dark_common_120 : RColor.dark_common_8;
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        RIcons(icon, color: iconColor),
        const SizedBox(height: 4),
        RText(label, color: RColor.yellow, weight: FontWeight.w700),
      ],
    );
  }
}
