import 'package:flutter/material.dart';
import 'package:tablet/style/icons.dart';

enum OrderStatusEnum { asap, schedule, rejected, confirmed, ready, completed }

Map<OrderStatusEnum, String> pathMap = {
  OrderStatusEnum.asap: IconPath.Asap,
  OrderStatusEnum.schedule: IconPath.Scheduled,
  OrderStatusEnum.rejected: IconPath.Rejected,
  OrderStatusEnum.confirmed: IconPath.Confirmed,
  OrderStatusEnum.ready: IconPath.Ready,
  OrderStatusEnum.completed: IconPath.Complete,
};

class OrderStatus extends StatelessWidget {
  final OrderStatusEnum status;
  final Widget? child;
  const OrderStatus({super.key, required this.status, this.child});

  @override
  Widget build(BuildContext context) {
    final icon = RIcons(pathMap[status]!, size: 20);
    if (child != null) {
      return Row(
        children: [
          icon,
          const SizedBox(width: 8),
          child!,
        ],
      );
    }
    return icon;
  }
}
