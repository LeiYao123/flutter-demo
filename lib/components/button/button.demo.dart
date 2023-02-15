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
        RuButton('yellow',
            size: BtnSizeEnum.sm, bgColor: RuColor.yellow, onPressed: () {}),
        RuButton(
          'green',
          size: BtnSizeEnum.sm,
          bgColor: RuColor.green,
          fgColor: RuColor.whitePure,
          onPressed: () {},
        ),
        RuButton(
          'red',
          bgColor: RuColor.red,
          size: BtnSizeEnum.sm,
          fgColor: RuColor.whitePure,
          onPressed: () {},
        ),
        RuButton('outlined',
            size: BtnSizeEnum.sm,
            bgColor: RuColor.yellow,
            isOutlined: true,
            onPressed: () {}),
        RuButton('outlined',
            size: BtnSizeEnum.sm,
            bgColor: RuColor.green,
            isOutlined: true,
            onPressed: () {}),
        RuButton('outlined',
            size: BtnSizeEnum.sm,
            bgColor: RuColor.red,
            isOutlined: true,
            onPressed: () {}),
        RuButton(
          '自定义 child',
          size: BtnSizeEnum.sm,
          bgColor: RuColor.yellow,
          onPressed: () {},
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              RuIcons.svg(IconPath.LinedStar, size: 16),
              const SizedBox(width: 8),
              const Text('自定义child'),
              const SizedBox(width: 8),
              RuIcons.svg(IconPath.SolidStar, size: 16),
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
        RuButton('yellow', bgColor: RuColor.yellow, onPressed: () {}),
        RuButton(
          'green',
          bgColor: RuColor.green,
          fgColor: RuColor.whitePure,
          onPressed: () {},
        ),
        RuButton(
          'red',
          bgColor: RuColor.red,
          fgColor: RuColor.whitePure,
          onPressed: () {},
        ),
        RuButton('outlined',
            bgColor: RuColor.yellow, isOutlined: true, onPressed: () {}),
        RuButton('outlined',
            bgColor: RuColor.green, isOutlined: true, onPressed: () {}),
        RuButton('outlined',
            bgColor: RuColor.red, isOutlined: true, onPressed: () {}),
        RuButton(
          '自定义 child',
          bgColor: RuColor.yellow,
          onPressed: () {},
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              RuIcons.svg(IconPath.LinedStar, size: 20),
              const SizedBox(width: 8),
              const Text('自定义child'),
              const SizedBox(width: 8),
              RuIcons.svg(IconPath.SolidStar, size: 20),
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
        RuButton('yellow',
            size: BtnSizeEnum.lg, bgColor: RuColor.yellow, onPressed: () {}),
        RuButton(
          'green',
          size: BtnSizeEnum.lg,
          bgColor: RuColor.green,
          fgColor: RuColor.whitePure,
          onPressed: () {},
        ),
        RuButton(
          'red',
          size: BtnSizeEnum.lg,
          bgColor: RuColor.red,
          fgColor: RuColor.whitePure,
          onPressed: () {},
        ),
        RuButton('outlined',
            size: BtnSizeEnum.lg,
            bgColor: RuColor.yellow,
            isOutlined: true,
            onPressed: () {}),
        RuButton('outlined',
            size: BtnSizeEnum.lg,
            bgColor: RuColor.green,
            isOutlined: true,
            onPressed: () {}),
        RuButton('outlined',
            size: BtnSizeEnum.lg,
            bgColor: RuColor.red,
            isOutlined: true,
            onPressed: () {}),
        RuButton(
          '自定义 child',
          size: BtnSizeEnum.lg,
          bgColor: RuColor.yellow,
          onPressed: () {},
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              RuIcons.svg(IconPath.LinedStar, size: 24),
              const SizedBox(width: 8),
              const Text('自定义child'),
              const SizedBox(width: 8),
              RuIcons.svg(IconPath.SolidStar, size: 24),
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
        RuButton('yellow',
            loading: true, bgColor: RuColor.yellow, onPressed: () {}),
        RuButton(
          'green',
          loading: true,
          bgColor: RuColor.green,
          fgColor: RuColor.whitePure,
          onPressed: () {},
        ),
        RuButton(
          'red',
          loading: true,
          bgColor: RuColor.red,
          fgColor: RuColor.whitePure,
          onPressed: () {},
        ),
        RuButton('outlined',
            loading: true,
            bgColor: RuColor.yellow,
            isOutlined: true,
            onPressed: () {}),
        RuButton('outlined',
            loading: true,
            bgColor: RuColor.green,
            isOutlined: true,
            onPressed: () {}),
        RuButton('outlined',
            loading: true,
            bgColor: RuColor.red,
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
        RuButton(
          'disabled',
          disabled: true,
          size: BtnSizeEnum.lg,
          bgColor: RuColor.yellow,
          onPressed: () {},
        ),
        RuButton('outlined disabled',
            disabled: true,
            size: BtnSizeEnum.lg,
            bgColor: RuColor.yellow,
            isOutlined: true,
            onPressed: () {}),
      ],
    );
  }

  Widget _getIconBtn() {
    return Wrap(
      children: [
        RuIconButton(
            icon: RuIcons.svg(IconPath.LinedStar, size: 24),
            bgColor: RuColor.green,
            margin: const EdgeInsets.all(16.0),
            onPressed: () {}),
        RuIconButton(
            isOutlined: true,
            icon: RuIcons.svg(IconPath.SolidStar, size: 24),
            bgColor: RuColor.green,
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
            child: RuButton(
              'Back',
              size: BtnSizeEnum.lg,
              bgColor: RuColor.common_4,
              onPressed: () {},
            ),
          ),
          const SizedBox(width: 24),
          Expanded(
            child: RuButton(
              'Confirm',
              fgColor: RuColor.whitePure,
              bgColor: RuColor.red,
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
          RuButton(
            'Back',
            size: BtnSizeEnum.lg,
            width: 120,
            bgColor: RuColor.common_4,
            onPressed: () {},
          ),
          Expanded(
            child: RuButton(
              'Confirm',
              margin: const EdgeInsets.only(left: 16.0),
              size: BtnSizeEnum.lg,
              onPressed: () {},
            ),
          ),
        ],
      ),
      RuButton(
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
