import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:r_dotted_line_border/r_dotted_line_border.dart';
import 'package:tablet/components/order_status/index.dart';
import 'package:tablet/components/text/index.dart';
import 'package:tablet/style/color.dart';

// 时间线对象
class TimelineItem {
  final String title;
  final String timeDesc;

  TimelineItem(this.title, this.timeDesc);
}

class OrderStatusTimeline extends StatelessWidget {
  final OrderStatusEnum status; // order 状态
  final String text; // order 名称
  final String orderNo; // 右上角 order 编号
  final List<TimelineItem> timelineList; // 时间线列表
  const OrderStatusTimeline({
    super.key,
    required this.status,
    required this.text,
    required this.orderNo,
    required this.timelineList,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        border: Border.all(width: 2, color: RColor.dark_common_8),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        children: [
          _bulidStatus(),
          const SizedBox(height: 16),
          _buildTimeline(),
        ],
      ),
    );
  }

  Widget _bulidStatus() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        OrderStatus(
          status: status,
          child: RText(
            text,
            color: RColor.dark_text_heavy,
            weight: FontWeight.w700,
            size: 20,
          ),
        ),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
          decoration: BoxDecoration(
            color: RColor.dark_bg_tertiary,
            borderRadius: BorderRadius.circular(8),
          ),
          child: RText(
            orderNo,
            color: RColor.dark_text_medium,
            size: 14,
            weight: FontWeight.w500,
          ),
        )
      ],
    );
  }

  // 时间线列表
  Widget _buildTimeline() {
    return Stack(
      children: [
        // 左边虚线
        Positioned(
          left: 10,
          top: 10,
          bottom: 28,
          child: Container(
            decoration: BoxDecoration(
              border: RDottedLineBorder(
                left: const BorderSide(color: RColor.dark_common_32),
              ),
            ),
          ),
        ),
        Column(
          children: timelineList.mapIndexed((index, e) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Container(
                      width: 8,
                      height: 8,
                      margin: const EdgeInsets.symmetric(horizontal: 6),
                      decoration: BoxDecoration(
                        border: Border.all(color: RColor.dark_common_32),
                        shape: BoxShape.circle,
                        color: RColor.dark_bg_secondary,
                      ),
                    ),
                    const SizedBox(width: 8),
                    RText(e.title, color: RColor.dark_text_lite, size: 12)
                  ],
                ),
                const SizedBox(height: 2),
                Container(
                  margin: const EdgeInsets.only(left: 28),
                  child: RText(e.timeDesc,
                      color: RColor.dark_text_heavy, size: 14),
                ),
                if (index != timelineList.length - 1) const SizedBox(height: 16)
              ],
            );
          }).toList(),
        ),
      ],
    );
  }
}

// order 信息
class OrderInfo extends StatelessWidget {
  const OrderInfo({super.key});

  Widget _buildOrderInfoItem(String label, String value) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        RText(
          label,
          size: 12,
          color: RColor.dark_text_lite,
          weight: FontWeight.w700,
        ),
        const SizedBox(height: 4),
        RText(label, color: RColor.dark_text_heavy),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    final List<String> _orderTag = [
      '😋 12 orders',
      '💵 Great tipper',
      '🥈 Silver rank',
      '🌶️ Spicy lover',
      '🥗 Veggie lover',
    ];
    return Padding(
      padding: const EdgeInsets.only(left: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          _buildOrderInfoItem('ORDER ID', '12345678'),
          const SizedBox(height: 24),
          _buildOrderInfoItem('ORDER TYPE', 'Pickup'),
          const SizedBox(height: 24),
          _buildOrderInfoItem('PAYMENT', 'Paid'),
          const SizedBox(height: 24),
          _buildOrderInfoItem('CUSTOMER', 'Cameron Warren'),
          const SizedBox(height: 4),
          const RText('832-555-1234', color: RColor.dark_text_heavy),
          const SizedBox(height: 8),
          Wrap(
            spacing: 4,
            runSpacing: 4,
            children: _orderTag
                .map(
                  (e) => Container(
                    decoration: BoxDecoration(
                      color: RColor.dark_bg_tertiary,
                      borderRadius: BorderRadius.circular(4),
                    ),
                    padding:
                        const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                    child: RText(e, size: 12, color: RColor.dark_text_heavy),
                  ),
                )
                .toList(),
          ),
        ],
      ),
    );
  }
}
