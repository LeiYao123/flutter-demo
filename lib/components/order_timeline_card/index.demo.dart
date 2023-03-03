import 'package:flutter/material.dart';
import 'package:tablet/components/order_status/index.dart';

import 'index.dart';

class OrderTimelineCardDemo extends StatelessWidget {
  const OrderTimelineCardDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(title: const Text('order timeline card')),
      body: Padding(
        padding: const EdgeInsets.all(32.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            SizedBox(height: 16),
            OrderTimelineCard(
              status: OrderStatusEnum.asap,
              left1: '6:00 PMAJabfgkhp',
              left2: 'Scheduled order',
              right1: 'Order submitted',
              right2: 'Scheduled order',
            ),
            SizedBox(height: 16),
            OrderTimelineCard(
              status: OrderStatusEnum.ready,
              left1: '6:00 PMAJabfgkhp',
              right1: 'Order submitted',
            ),
            SizedBox(height: 16),
            OrderTimelineCard(
              status: OrderStatusEnum.completed,
              left1: '6:00 PMAJabfgkhp',
              right1: 'Order submitted',
              right2: 'Order submitted',
            ),
            SizedBox(height: 16),
            OrderTimelineCard(
              type: 'future',
              status: OrderStatusEnum.completed,
              left1: '6:00 PMAJabfgkhp',
              left2: 'Order submitted',
            ),
          ],
        ),
      ),
    );
  }
}
