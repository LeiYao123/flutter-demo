import 'package:flutter/material.dart';
import 'package:tablet/style/icons.dart';
import 'package:tablet/style/color.dart';
import 'package:tablet/components/button.dart';

class ButtonPage extends StatelessWidget {
  const ButtonPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Icons 展示'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Row(
              children: [
                RuButton(
                  'primary',
                  size: BtnSizeEnum.lg,
                  color: BtnColorEnum.primary,
                  loading: true,
                  onPressed: () {
                    print('secondary-button');
                  },
                ),
                RuButton(
                  'primary',
                  size: BtnSizeEnum.lg,
                  color: BtnColorEnum.primary,
                  iconBefore: RuIcons.svg('Lined/star'),
                  iconAfter: RuIcons.svg('Solid/star'),
                  onPressed: () {
                    print('secondary-button');
                  },
                ),
                RuButton(
                  'disabled primary',
                  size: BtnSizeEnum.lg,
                  color: BtnColorEnum.primary,
                  disabled: true,
                  onPressed: () {
                    print('secondary-button');
                  },
                ),
                RuButton(
                  'primary',
                  isOutlined: true,
                  size: BtnSizeEnum.lg,
                  color: BtnColorEnum.primary,
                  iconBefore: RuIcons.svg('Lined/star'),
                  iconAfter: RuIcons.svg('Solid/star'),
                  onPressed: () {
                    print('secondary-button');
                  },
                ),
                RuButton(
                  'primary',
                  isOutlined: true,
                  size: BtnSizeEnum.lg,
                  color: BtnColorEnum.primary,
                  disabled: true,
                  onPressed: () {
                    print('secondary-button');
                  },
                ),
              ],
            ),
            const SizedBox(height: 16.0),
            Row(
              children: [
                RuButton(
                  'secondary-button',
                  size: BtnSizeEnum.md,
                  color: BtnColorEnum.secondary,
                  onPressed: () {
                    print('secondary-button');
                  },
                ),
                RuButton(
                  'secondary-button',
                  isOutlined: true,
                  size: BtnSizeEnum.md,
                  color: BtnColorEnum.secondary,
                  onPressed: () {
                    print('secondary-button');
                  },
                ),
                RuButton(
                  'secondary-button',
                  size: BtnSizeEnum.md,
                  color: BtnColorEnum.secondary,
                  onPressed: () {
                    print('secondary-button');
                  },
                ),
              ],
            ),
            const SizedBox(height: 16.0),
            Row(
              children: [
                RuButton(
                  'warning-button',
                  size: BtnSizeEnum.sm,
                  color: BtnColorEnum.warning,
                  onPressed: () {
                    print('warning-button');
                  },
                ),
                RuButton(
                  'warning-button',
                  isOutlined: true,
                  size: BtnSizeEnum.sm,
                  color: BtnColorEnum.warning,
                  onPressed: () {
                    print('warning-button');
                  },
                ),
              ],
            ),
            const SizedBox(height: 16.0),
            Flex(
              direction: Axis.horizontal,
              children: [
                RuButton(
                  'primary',
                  size: BtnSizeEnum.lg,
                  color: BtnColorEnum.primary,
                  onPressed: () {},
                ),
                Expanded(
                    child: RuButton(
                  'primary',
                  size: BtnSizeEnum.lg,
                  color: BtnColorEnum.primary,
                  onPressed: () {},
                )),
              ],
            ),
            const Text.rich(TextSpan(children: [
              TextSpan(text: "Home: "),
              TextSpan(
                text: "https://flutterchina.club",
                style: TextStyle(color: Colors.blue),
              ),
            ])),
            Row(
              children: [
                RuIconButton(
                    icon: RuIcons.svg('Lined/star', size: 20),
                    bgColor: RuColor.green,
                    onPressed: () {}),
                const SizedBox(width: 12),
                RuIconButton(
                    isOutlined: true,
                    icon: RuIcons.svg('Lined/star', size: 20),
                    bgColor: RuColor.green,
                    onPressed: () {}),
              ],
            )
          ],
        ),
      ),
    );
  }
}
