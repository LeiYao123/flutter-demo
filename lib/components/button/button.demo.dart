import 'package:flutter/material.dart';
import 'package:tablet/style/icons.dart';
import 'package:tablet/style/color.dart';
import 'index.dart';

class ButtonDemo extends StatelessWidget {
  const ButtonDemo({super.key});

  Widget _getsmBtn() {
    return Wrap(
      alignment: WrapAlignment.start,
      spacing: 16,
      runSpacing: 16,
      children: [
        RButton('yellow',
            size: BtnSizeEnum.sm, bgColor: RColor.yellow, onPressed: () {}),
        RButton(
          'green',
          size: BtnSizeEnum.sm,
          bgColor: RColor.green,
          fgColor: RColor.white_pure,
          onPressed: () {},
        ),
        RButton(
          'red',
          bgColor: RColor.red,
          size: BtnSizeEnum.sm,
          fgColor: RColor.white_pure,
          onPressed: () {},
        ),
        RButton('outlined',
            size: BtnSizeEnum.sm,
            bgColor: RColor.yellow,
            isOutlined: true,
            onPressed: () {}),
        RButton('outlined',
            size: BtnSizeEnum.sm,
            bgColor: RColor.green,
            isOutlined: true,
            onPressed: () {}),
        RButton('outlined',
            size: BtnSizeEnum.sm,
            bgColor: RColor.red,
            isOutlined: true,
            onPressed: () {}),
        RButton(
          '自定义 child',
          size: BtnSizeEnum.sm,
          bgColor: RColor.yellow,
          onPressed: () {},
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              RIcons(IconPath.LinedStar, size: 16),
              const SizedBox(width: 8),
              const Text('自定义child'),
              const SizedBox(width: 8),
              RIcons(IconPath.SolidStar, size: 16),
            ],
          ),
        ),
      ],
    );
  }

  Widget _getmdBtn() {
    return Wrap(
      alignment: WrapAlignment.start,
      spacing: 16,
      runSpacing: 16,
      children: [
        RButton('yellow', bgColor: RColor.yellow, onPressed: () {}),
        RButton(
          'green',
          bgColor: RColor.green,
          fgColor: RColor.white_pure,
          onPressed: () {},
        ),
        RButton(
          'red',
          bgColor: RColor.red,
          fgColor: RColor.white_pure,
          onPressed: () {},
        ),
        RButton('outlined',
            bgColor: RColor.yellow, isOutlined: true, onPressed: () {}),
        RButton('outlined',
            bgColor: RColor.green, isOutlined: true, onPressed: () {}),
        RButton('outlined',
            bgColor: RColor.red, isOutlined: true, onPressed: () {}),
        RButton(
          '自定义 child',
          bgColor: RColor.yellow,
          onPressed: () {},
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              RIcons(IconPath.LinedStar, size: 20),
              const SizedBox(width: 8),
              const Text('自定义child'),
              const SizedBox(width: 8),
              RIcons(IconPath.SolidStar, size: 20),
            ],
          ),
        ),
      ],
    );
  }

  Widget _getLgBtn() {
    return Wrap(
      alignment: WrapAlignment.start,
      spacing: 16,
      runSpacing: 16,
      children: [
        RButton('yellow',
            size: BtnSizeEnum.lg, bgColor: RColor.yellow, onPressed: () {}),
        RButton(
          'green',
          size: BtnSizeEnum.lg,
          bgColor: RColor.green,
          fgColor: RColor.white_pure,
          onPressed: () {},
        ),
        RButton(
          'red',
          size: BtnSizeEnum.lg,
          bgColor: RColor.red,
          fgColor: RColor.white_pure,
          onPressed: () {},
        ),
        RButton('outlined',
            size: BtnSizeEnum.lg,
            bgColor: RColor.yellow,
            isOutlined: true,
            onPressed: () {}),
        RButton('outlined',
            size: BtnSizeEnum.lg,
            bgColor: RColor.green,
            isOutlined: true,
            onPressed: () {}),
        RButton('outlined',
            size: BtnSizeEnum.lg,
            bgColor: RColor.red,
            isOutlined: true,
            onPressed: () {}),
        RButton(
          '自定义 child',
          size: BtnSizeEnum.lg,
          bgColor: RColor.yellow,
          onPressed: () {},
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              RIcons(IconPath.LinedStar, size: 24),
              const SizedBox(width: 8),
              const Text('自定义child'),
              const SizedBox(width: 8),
              RIcons(IconPath.SolidStar, size: 24),
            ],
          ),
        ),
      ],
    );
  }

  Widget _getmdLoadingBtn() {
    return Wrap(
      alignment: WrapAlignment.start,
      spacing: 16,
      runSpacing: 16,
      children: [
        RButton('yellow',
            loading: true, bgColor: RColor.yellow, onPressed: () {}),
        RButton(
          'green',
          loading: true,
          bgColor: RColor.green,
          fgColor: RColor.white_pure,
          onPressed: () {},
        ),
        RButton(
          'red',
          loading: true,
          bgColor: RColor.red,
          fgColor: RColor.white_pure,
          onPressed: () {},
        ),
        RButton('outlined',
            loading: true,
            bgColor: RColor.yellow,
            isOutlined: true,
            onPressed: () {}),
        RButton('outlined',
            loading: true,
            bgColor: RColor.green,
            isOutlined: true,
            onPressed: () {}),
        RButton('outlined',
            loading: true,
            bgColor: RColor.red,
            isOutlined: true,
            onPressed: () {}),
      ],
    );
  }

  Widget _getDisabledBtn() {
    return Wrap(
      alignment: WrapAlignment.start,
      spacing: 16,
      runSpacing: 16,
      children: [
        RButton(
          'disabled',
          disabled: true,
          size: BtnSizeEnum.lg,
          bgColor: RColor.yellow,
          onPressed: () {},
        ),
        RButton('outlined disabled',
            disabled: true,
            size: BtnSizeEnum.lg,
            bgColor: RColor.yellow,
            isOutlined: true,
            onPressed: () {}),
      ],
    );
  }

  Widget _getIconBtn() {
    return Wrap(
      children: [
        RIconButton(
            icon: RIcons(IconPath.LinedStar),
            bgColor: RColor.green,
            margin: const EdgeInsets.all(16.0),
            onPressed: () {}),
        RIconButton(
            isOutlined: true,
            icon: RIcons(IconPath.SolidStar),
            bgColor: RColor.green,
            margin: const EdgeInsets.all(16.0),
            onPressed: () {}),
      ],
    );
  }

  List<Widget> _getAverageBtn() {
    return [
      const SizedBox(height: 32),
      const Text('左右平分的button'),
      const Divider(),
      Row(
        children: [
          Expanded(
            child: RButton(
              'Back',
              size: BtnSizeEnum.lg,
              bgColor: RColor.light_common_4,
              onPressed: () {},
            ),
          ),
          const SizedBox(width: 24),
          Expanded(
            child: RButton(
              'Confirm',
              fgColor: RColor.white_pure,
              bgColor: RColor.red,
              size: BtnSizeEnum.lg,
              onPressed: () {},
            ),
          ),
        ],
      ),
      const SizedBox(height: 32),
      const Text('Expanded button'),
      const Divider(),
      Row(
        children: [
          RButton(
            'Back',
            size: BtnSizeEnum.lg,
            width: 120,
            bgColor: RColor.light_common_4,
            onPressed: () {},
          ),
          Expanded(
            child: RButton(
              'Confirm',
              margin: const EdgeInsets.only(left: 16.0),
              size: BtnSizeEnum.lg,
              onPressed: () {},
            ),
          ),
        ],
      ),
      RButton(
        '独占一行的 button',
        isBlock: true,
        size: BtnSizeEnum.lg,
        margin: const EdgeInsets.symmetric(vertical: 32),
        onPressed: () {},
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    final mediaQueryData = MediaQuery.of(context);
    print(mediaQueryData);

    return Scaffold(
      appBar: AppBar(title: const Text('Button 展示')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('sm'),
            const Divider(),
            _getsmBtn(),
            const SizedBox(height: 32),
            const Text('md'),
            const Divider(),
            _getmdBtn(),
            const SizedBox(height: 32),
            const Text('lg'),
            const Divider(),
            _getLgBtn(),
            const SizedBox(height: 32),
            const Text('md loading'),
            const Divider(),
            _getmdLoadingBtn(),
            const SizedBox(height: 32),
            const Text('lg disabled'),
            const Divider(),
            _getDisabledBtn(),
            const SizedBox(height: 32),
            const Text('icon button'),
            const Divider(),
            _getIconBtn(),
            ..._getAverageBtn(),
          ],
        ),
      ),
    );
  }
}
