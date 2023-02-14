import 'package:flutter/material.dart';
import 'package:tablet/components/order-status/index.dart';

class OrderStatusCircleDemo extends StatelessWidget {
  const OrderStatusCircleDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Order Status Circle')),
      body: Center(
        child: SizedBox(
          width: 180,
          height: 300,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              OrderStatus(
                  status: OrderStatusEnum.asap, child: Text('New Order ASAP')),
              OrderStatus(
                  status: OrderStatusEnum.schedule,
                  child: Text('New Order Schedule')),
              OrderStatus(
                  status: OrderStatusEnum.rejected, child: Text('Rejected')),
              OrderStatus(
                  status: OrderStatusEnum.confirmed, child: Text('Confirmed')),
              OrderStatus(status: OrderStatusEnum.ready, child: Text('Ready')),
              OrderStatus(
                  status: OrderStatusEnum.completed, child: Text('Complete')),
            ],
          ),
        ),
      ),
    );
  }
}
