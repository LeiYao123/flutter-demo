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
  final double? size;
  const OrderStatus({
    super.key,
    required this.status,
    this.child,
    this.size = 24,
  });

  @override
  Widget build(BuildContext context) {
    final icon = RIcons(pathMap[status]!, size: size!);
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
