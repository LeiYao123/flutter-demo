import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:tablet/components/order_olo_status/index.dart';
import 'package:tablet/components/order_status_tab/index.dart';

import 'index.dart';

class OrderCardDemo extends StatefulWidget {
  const OrderCardDemo({super.key});

  @override
  State<OrderCardDemo> createState() => _OrderCardDemoState();
}

class _OrderCardDemoState extends State<OrderCardDemo> {
  int _activeIndex = 0;
  int _tabIndex = 0;

  List<Widget> _buildOrderList() {
    List arr = List.generate(8, (index) => index);
    return arr.mapIndexed((index, element) {
      return OrderCard(
        isActive: _activeIndex == index,
        tagDesc: index == 2 ? null : '⏰ 23:59:59',
        title: 'Cameron W',
        desc: '1234 · Pickup',
        isAsap: index.isEven ? true : false,
        timeDesc: index.isEven ? null : '10:30 AM',
        onTap: () => setState(() => _activeIndex = index),
      );
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          color: const Color(0xff161616),
          width: 400,
          child: Column(
            children: [
              OrderOLOStatus(
                isOpen: true,
                time: '9:45 PM',
                onPressed: () {
                  print('open');
                },
              ),
              Container(
                decoration: const BoxDecoration(
                  border: Border(
                    top: BorderSide(color: Color(0xff404040)),
                    bottom: BorderSide(color: Color(0xff404040)),
                  ),
                ),
                child: OrderStatusTab(
                  activeIndex: _tabIndex,
                  tabs: [
                    TabItem('NEW', 1, 8),
                    TabItem('READY', 2, 5),
                    TabItem('COMPLETE', 3, 9),
                  ],
                  onChange: (index) => setState(() => _tabIndex = index),
                  onSearch: (e) {
                    print('搜索关键词 $e');
                  },
                ),
              ),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(children: _buildOrderList()),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
