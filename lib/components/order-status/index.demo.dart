import 'package:flutter/material.dart';
import 'package:tablet/components/order-status/index.dart';

class OrderStatusCircleDemo extends StatelessWidget {
  const OrderStatusCircleDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Order Status Circle')),
      body: OrderStatus(),
    );
  }
}
