import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:tablet/style/icons.dart';
import './order_layout.dart';

class LayoutDemo extends StatefulWidget {
  const LayoutDemo({super.key});

  @override
  State<LayoutDemo> createState() => _LayoutDemoState();
}

class _LayoutDemoState extends State<LayoutDemo> {
  int _pageIndex = 0;

  // navs icon
  static List<NavItemModel> navCfg = [
    NavItemModel(IconPath.calendar, const Text('one'), '1'),
    NavItemModel(IconPath.cateringbag, const Text('two'), '2'),
    NavItemModel(IconPath.clipboard, const Text('three'), '3'),
    NavItemModel(IconPath.receipt, const Text('four'), ''),
    NavItemModel(IconPath.utensils, const Text('four'), ''),
  ];

  List<Widget> _getPageNavs() {
    return navCfg.mapIndexed((index, element) {
      return NavItem(
        icon: element.icon,
        label: element.count,
        isActive: index == _pageIndex,
      );
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: OrderLayout(
          pageIndex: _pageIndex,
          pageView: navCfg[_pageIndex].view,
          pageNavs: _getPageNavs(),
          onChanged: (index) => setState(() => _pageIndex = index),
        ),
      ),
    );
  }
}

class NavItemModel {
  final String icon;
  final Widget view;
  final String count;

  NavItemModel(this.icon, this.view, this.count);
}
