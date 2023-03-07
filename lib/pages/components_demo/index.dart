import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tablet/components/checkbox/index.demo.dart';
import 'package:tablet/components/drawer/index.demo.dart';
import 'package:tablet/components/button/index.dart';
import 'package:tablet/components/button/button.demo.dart';
import 'package:tablet/components/input/index.demo.dart';
import 'package:tablet/components/layout/index.demo.dart';
import 'package:tablet/components/order_card/index.demo.dart';
import 'package:tablet/components/order_odd_progress/index.demo.dart';
import 'package:tablet/components/order_olo_middle_bar/index.demo.dart';
import 'package:tablet/components/order_olo_status/index.demo.dart';
import 'package:tablet/components/order_status/index.demo.dart';
import 'package:tablet/components/order_status_tab/index.demo.dart';
import 'package:tablet/components/order_timeline_card/index.demo.dart';
import 'package:tablet/components/text/index.dart';
import 'color.demo.dart';
import 'icon.demo.dart';
import 'sliver.demo.dart';

import './effect/index.dart';

class ComponentsDemo extends StatelessWidget {
  const ComponentsDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Components demo')),
      body: SafeArea(
        child: Container(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const RText('基础组件'),
                const Divider(),
                Wrap(
                  direction: Axis.horizontal,
                  spacing: 16,
                  runSpacing: 24,
                  children: [
                    RButton(
                      'color demo',
                      onPressed: () => Get.to(() => ColorDemoPage()),
                    ),
                    RButton(
                      'button demo',
                      onPressed: () => Get.to(() => const ButtonDemo()),
                    ),
                    RButton(
                      'checkbox',
                      onPressed: () => Get.to(() => const CheckboxDemo()),
                    ),
                    RButton(
                      'icon demo',
                      onPressed: () => Get.to(() => const IconDemo()),
                    ),
                    RButton(
                      'Drawer demo',
                      onPressed: () => Get.to(() => const DrawerDemo()),
                    ),
                    RButton(
                      'input demo',
                      onPressed: () => Get.to(() => const InputDemo()),
                    ),
                  ],
                ),
                const SizedBox(height: 32),
                const RText('order components 示例'),
                const Divider(),
                Wrap(
                  spacing: 16,
                  runSpacing: 24,
                  children: [
                    RButton(
                      'navbar demo',
                      onPressed: () => Get.to(() => const LayoutDemo()),
                    ),
                    RButton(
                      'order status circle demo',
                      onPressed: () =>
                          Get.to(() => const OrderStatusCircleDemo()),
                    ),
                    RButton(
                      'order card demo',
                      onPressed: () => Get.to(() => const OrderCardDemo()),
                    ),
                    RButton(
                      'order status tab demo',
                      onPressed: () => Get.to(() => const OrderStatusTabDemo()),
                    ),
                    RButton(
                      'order timeline demo',
                      onPressed: () => Get.to(
                        () => const OrderTimelineCardDemo(),
                      ),
                    ),
                    RButton(
                      'order olo status demo',
                      onPressed: () => Get.to(
                        () => const OrderOLOStatusDemo(),
                      ),
                    ),
                    RButton(
                      'order olo middle bar',
                      onPressed: () => Get.to(
                        () => const OrderOLOMiddleBarDemo(),
                      ),
                    ),
                    RButton(
                      'order odd progress',
                      onPressed: () => Get.to(
                        () => const OrderODDProgressDemo(),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 32),
                const RText('一些示例 demo'),
                const Divider(),
                Wrap(
                  spacing: 16,
                  runSpacing: 24,
                  children: [
                    RButton('sliver demo',
                        onPressed: () => Get.to(() => const SliverDemoPage())),
                    RButton('effect demo',
                        onPressed: () => Get.to(() => const EffectDemoPage())),
                  ],
                ),
              ],
            )),
      ),
    );
  }
}
