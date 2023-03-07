import 'package:flutter/material.dart';
import 'package:tablet/components/text/index.dart';
import 'package:tablet/style/color.dart';

// progress 类型
enum ProgressEnum {
  confirming,
  assigning,
  driver_assigned,
  store_arrival,
  routing,
  arrived,
  completed,
  error
}

class OrderODDProgress extends StatelessWidget {
  final ProgressEnum progress;
  final String? name;
  const OrderODDProgress({
    super.key,
    required this.progress,
    this.name,
  });
  // progress 的段数
  static const len = 6;

  _ProgressItem _getProgressInfo() {
    String text = '';
    int value = 0;
    Color color = RColor.blue;
    switch (progress) {
      case ProgressEnum.confirming:
        text = 'Confirm order to dispatch a driver';
        value = 0;
        color = RColor.blue;
        break;
      case ProgressEnum.assigning:
        text = 'Finding a driver to dispatch...';
        value = 1;
        color = RColor.blue;
        break;
      case ProgressEnum.driver_assigned:
        text = ' is on the way to your store';
        value = 2;
        color = RColor.blue;
        break;
      case ProgressEnum.store_arrival:
        text = ' has arrived at your store';
        value = 3;
        color = RColor.blue;
        break;
      case ProgressEnum.routing:
        text = ' is on the way to the customer';
        value = 4;
        color = RColor.blue;
        break;
      case ProgressEnum.arrived:
        text = ' has arrived at the customer';
        value = 5;
        color = RColor.blue;
        break;
      case ProgressEnum.completed:
        text = ' has completed the delivery';
        value = 6;
        color = RColor.green;
        break;
      case ProgressEnum.error:
        text = ' · Check details for solution';
        value = 4;
        color = RColor.red;
        break;
      default:
    }

    Widget child = Row(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        if (name != null)
          RText(
            '$name ',
            weight: FontWeight.w700,
          ),
        if (progress == ProgressEnum.error)
          const RText(
            'Delivery Cancelled ',
            weight: FontWeight.w700,
            color: RColor.red,
          ),
        RText(text, size: 14, color: RColor.light_text_heavy),
      ],
    );
    return _ProgressItem(child, value, color);
  }

  @override
  Widget build(BuildContext context) {
    final pItem = _getProgressInfo();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        pItem.child,
        const SizedBox(height: 4),
        SizedBox(
          width: 227,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: List.generate(len, (index) {
              return [
                Expanded(
                  child: Container(
                    height: 3,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(1),
                      color: index < pItem.value
                          ? pItem.color
                          : RColor.light_common_8,
                    ),
                  ),
                ),
                if (index != len - 1) const SizedBox(width: 4),
              ];
            }).expand((e) => e).toList(),
          ),
        ),
      ],
    );
  }
}

class _ProgressItem {
  final Widget child; // 上方显示文字
  final int value; // 高亮数值
  final Color color; // 高亮颜色

  _ProgressItem(this.child, this.value, this.color);
}
