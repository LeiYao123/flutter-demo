import 'package:flutter/material.dart';
import 'package:tablet/style/color.dart';

enum BtnColorEnum { primary, secondary, warning }

enum BtnSizeEnum { sm, md, lg }

const Map<BtnSizeEnum, double> fontSizeMap = {
  BtnSizeEnum.sm: 12,
  BtnSizeEnum.md: 16,
  BtnSizeEnum.lg: 20,
};

const Map<BtnSizeEnum, List<double>> paddingSizeMap = {
  BtnSizeEnum.sm: [16, 14],
  BtnSizeEnum.md: [24, 18],
  BtnSizeEnum.lg: [24, 22],
};

class RuButton extends StatelessWidget {
  final String text;
  final BtnColorEnum? color;
  final BtnSizeEnum size;
  // 外边框，是否独占一行，禁用，loading
  final bool isOutlined, isBlock, disabled, loading;
  final Widget? iconBefore;
  final Widget? iconAfter;
  final Function() onPressed;
  RuButton(
    this.text, {
    super.key,
    // this.color = BtnColorEnum.primary,
    this.color,
    this.size = BtnSizeEnum.md,
    this.isOutlined = false,
    this.isBlock = false,
    this.disabled = false,
    this.loading = false,
    this.iconBefore,
    this.iconAfter,
    required this.onPressed,
  });

  List<Widget> _getChildren() {
    final List<Widget> btnChildren = [Text(text)];
    if (iconBefore != null) {
      btnChildren.insert(
        0,
        Padding(
          padding: const EdgeInsets.only(right: 8),
          child: iconBefore,
        ),
      );
    }
    if (iconAfter != null) {
      btnChildren.add(Padding(
        padding: const EdgeInsets.only(left: 8),
        child: iconAfter,
      ));
    }
    if (loading) {
      btnChildren.insert(
        0,
        const Padding(
          padding: EdgeInsets.only(right: 8),
          child: SizedBox(
            height: 20,
            width: 20,
            child: CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation(Colors.white),
            ),
          ),
        ),
      );
    }
    return btnChildren;
  }

  Map<BtnColorEnum, Color> backgroundColorMap = {
    BtnColorEnum.primary: RuColor.yellow,
    BtnColorEnum.secondary: RuColor.bgPrimary,
    BtnColorEnum.warning: RuColor.red,
  };

  Map<BtnColorEnum, Color> foregroundColorMap = {
    BtnColorEnum.primary: RuColor.textHeavy,
    BtnColorEnum.secondary: RuColor.textHeavy,
    BtnColorEnum.warning: RuColor.textReverse,
  };

  @override
  Widget build(BuildContext context) {
    final bgColor = backgroundColorMap[color ?? BtnColorEnum.primary];
    final fgColor = foregroundColorMap[color ?? BtnColorEnum.primary];
    final shape = RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(8.0),
    );
    final textStyle = TextStyle(
      fontWeight: FontWeight.w700,
      fontSize: fontSizeMap[size],
    );
    final padding = EdgeInsets.fromLTRB(
      paddingSizeMap[size]![0],
      paddingSizeMap[size]![1],
      paddingSizeMap[size]![0],
      paddingSizeMap[size]![1],
    );
    // 是否独占一行
    final mainAxisSize = isBlock ? MainAxisSize.max : MainAxisSize.min;
    final onClick = (disabled || loading) ? null : onPressed;

// 详细自定义各种状态写的背景颜色，一般情况下 all 足矣
// backgroundColor: MaterialStateProperty.resolveWith(
// (Set<MaterialState> states) {
// if (states.contains(MaterialState.disabled)) {
// return Colors.black;
// if (states.contains (MaterialState.pressed)) {
// return Colors.blue;
// return Colors.red;
// ),
    final style = ButtonStyle(
      backgroundColor: isOutlined ? null : MaterialStateProperty.all(bgColor),
      foregroundColor: isOutlined
          ? MaterialStateProperty.all(bgColor)
          : MaterialStateProperty.all(fgColor),
      elevation: MaterialStateProperty.all(0),
      padding: MaterialStateProperty.all(padding),
      shape: MaterialStateProperty.all(shape),
      textStyle: MaterialStateProperty.all(textStyle),
    );

    final child = Row(
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: mainAxisSize,
      children: _getChildren(),
    );
    if (isOutlined) {
      return OutlinedButton(onPressed: onClick, style: style, child: child);
    }
    return ElevatedButton(onPressed: onClick, style: style, child: child);
  }
}

// Icon button 组件
class RuIconButton extends StatelessWidget {
  final Widget icon;
  final Color bgColor;
  final bool isOutlined;
  final int size;
  final Function() onPressed;

  const RuIconButton({
    super.key,
    required this.icon,
    required this.bgColor,
    this.isOutlined = false,
    this.size = 52,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    final style = ButtonStyle(
      padding: MaterialStateProperty.all(const EdgeInsets.all(16)),
      shape: MaterialStateProperty.all(const CircleBorder()),
      backgroundColor: isOutlined ? null : MaterialStateProperty.all(bgColor),
      side: isOutlined
          ? MaterialStateProperty.all(BorderSide(
              color: bgColor,
              width: 2,
            ))
          : null,
    );
    if (isOutlined) {
      return OutlinedButton(onPressed: onPressed, style: style, child: icon);
    }
    return ElevatedButton(onPressed: onPressed, style: style, child: icon);
  }
}
