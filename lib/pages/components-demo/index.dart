import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tablet/components/Drawer/index.demo.dart';
import 'package:tablet/components/button/index.dart';
import 'package:tablet/components/button/button.demo.dart';
import 'package:tablet/components/input/index.demo.dart';
import 'package:tablet/components/order-status/index.demo.dart';
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
                const RuText('基础组件'),
                const Divider(),
                Wrap(
                  direction: Axis.horizontal,
                  spacing: 24,
                  runSpacing: 24,
                  children: [
                    RuButton('color demo',
                        onPressed: () => Get.to(() => ColorDemoPage())),
                    RuButton('button demo',
                        onPressed: () => Get.to(() => const ButtonDemo())),
                    RuButton('icon demo',
                        onPressed: () => Get.to(() => const IconDemo())),
                    RuButton('order status circle demo',
                        onPressed: () =>
                            Get.to(() => const OrderStatusCircleDemo())),
                    RuButton('Drawer demo',
                        onPressed: () => Get.to(() => const DrawerDemo())),
                    RuButton('input demo',
                        onPressed: () => Get.to(() => const InputDemo())),
                  ],
                ),
                const SizedBox(height: 32),
                const RuText('一些示例 demo'),
                const Divider(),
                Wrap(
                  direction: Axis.horizontal,
                  spacing: 23,
                  runSpacing: 24,
                  children: [
                    RuButton('sliver demo',
                        onPressed: () => Get.to(() => const SliverDemoPage())),
                    RuButton('effect demo',
                        onPressed: () => Get.to(() => const EffectDemoPage())),
                  ],
                ),
              ],
            )),
      ),
    );
  }
}
