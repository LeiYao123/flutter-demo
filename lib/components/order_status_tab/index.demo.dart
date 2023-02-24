import 'package:flutter/material.dart';

import 'index.dart';

class OrderStatusTabDemo extends StatefulWidget {
  const OrderStatusTabDemo({super.key});

  @override
  State<OrderStatusTabDemo> createState() => _OrderStatusTabDemoState();
}

class _OrderStatusTabDemoState extends State<OrderStatusTabDemo> {
  int _activeIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Order status tab demo')),
      body: SizedBox(
          width: 400,
          child: OrderStatusTab(
            activeIndex: _activeIndex,
            tabs: [
              TabItem('NEW', 1, 8),
              TabItem('READY', 2, 5),
              TabItem('COMPLETE', 3, 9),
            ],
            onChange: (index) => setState(() => _activeIndex = index),
            onSearch: (e) {
              print('搜索关键词 $e');
            },
          )),
    );
  }
}
