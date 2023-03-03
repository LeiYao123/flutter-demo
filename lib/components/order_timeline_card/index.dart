import 'package:flutter/material.dart';
import 'package:tablet/components/order_status/index.dart';
import 'package:tablet/components/text/index.dart';
import 'package:tablet/style/color.dart';

class OrderTimelineCard extends StatelessWidget {
  final String? type; // default 、future
  final OrderStatusEnum status;
  final String? left1;
  final String? left2;
  final String? right1;
  final String? right2;
  const OrderTimelineCard({
    super.key,
    this.type = 'default',
    required this.status,
    this.left1,
    this.left2,
    this.right1,
    this.right2,
  });

  // type: primary, desc
  Widget _buildText(
    String type,
    String? text, {
    FontWeight? weight = FontWeight.w400,
  }) {
    if (type == 'primary') {
      return RText(
        text,
        size: 18,
        weight: weight,
        color: RColor.light_text_heavy,
        textAlign: TextAlign.end,
      );
    }
    return RText(
      text,
      size: 16,
      weight: FontWeight.w400,
      color: RColor.light_text_medium,
      textAlign: TextAlign.end,
    );
  }

  List<Widget> _buildDefault() {
    return [
      Row(
        children: [
          OrderStatus(status: status),
          const SizedBox(width: 8),
          _buildText('primary', left1, weight: FontWeight.w700),
          Expanded(child: _buildText('primary', right1)),
        ],
      ),
      Row(
        children: [
          const SizedBox(width: 32),
          if (left2 != null) _buildText('desc', left2),
          if (right2 != null) Expanded(child: _buildText('desc', right2)),
        ],
      ),
    ];
  }

  List<Widget> _buildFuture() {
    return [
      OrderStatus(status: status),
      const SizedBox(height: 8),
      _buildText('primary', left1, weight: FontWeight.w700),
      if (left2 != null) ...[
        const SizedBox(height: 2),
        _buildText('desc', left2)
      ],
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: RColor.light_common_2,
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: type == 'default' ? _buildDefault() : _buildFuture(),
      ),
    );
  }
}
