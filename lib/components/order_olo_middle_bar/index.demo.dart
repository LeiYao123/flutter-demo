import 'package:flutter/material.dart';
import 'package:tablet/components/order_status/index.dart';
import 'package:tablet/style/color.dart';

import 'index.dart';

class OrderOLOMiddleBarDemo extends StatelessWidget {
  const OrderOLOMiddleBarDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          width: 264,
          padding: const EdgeInsets.all(16),
          color: RColor.dark_bg_secondary,
          child: Column(
            children: [
              OrderStatusTimeline(
                status: OrderStatusEnum.ready,
                text: 'New Order',
                orderNo: '# 1',
                timelineList: [
                  TimelineItem('😋 Order submitted', 'Today @ 12:30 PM'),
                  TimelineItem('🚗 Courier pickup', 'Pending confirmation'),
                  TimelineItem('Requested delivery', 'Today @ 2:30 PM'),
                ],
              ),
              const SizedBox(height: 32),
              const OrderInfo(),
            ],
          ),
        ),
      ),
    );
  }
}
