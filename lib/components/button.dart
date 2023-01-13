import 'package:flutter/material.dart';
import 'package:tablet/style/color.dart';

enum BtnColorEnum { primary, secondary, warning }

enum BtnSizeEnum { sm, md, lg }

final Map<BtnSizeEnum, double> fontSizeMap = {
  BtnSizeEnum.sm: 12,
  BtnSizeEnum.md: 16,
  BtnSizeEnum.lg: 20,
};

final Map<BtnSizeEnum, List<double>> paddingSizeMap = {
  BtnSizeEnum.sm: [16, 14],
  BtnSizeEnum.md: [24, 18],
  BtnSizeEnum.lg: [24, 22],
};

final Map<BtnColorEnum, Color> backgroundColorMap = {
  BtnColorEnum.primary: RuColor.yellow,
  BtnColorEnum.secondary: RuColor.gray,
  BtnColorEnum.warning: RuColor.red,
};

final Map<BtnColorEnum, Color> foregroundColorMap = {
  BtnColorEnum.primary: RuColor.black,
  BtnColorEnum.secondary: RuColor.black,
  BtnColorEnum.warning: RuColor.white,
};

class RuButton extends StatelessWidget {
  final String text;
  final BtnColorEnum color;
  final BtnSizeEnum size;
  final bool isOutlined;
  final bool isBlock; // 是否独占一行
  final bool disabled;
  final bool loading;
  final Widget? iconBefore;
  final Widget? iconAfter;
  final Function() onPressed;

  const RuButton(
    this.text, {
    super.key,
    this.color = BtnColorEnum.primary,
    this.isOutlined = false,
    this.isBlock = false,
    this.size = BtnSizeEnum.md,
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

  @override
  Widget build(BuildContext context) {
    final bgColor = backgroundColorMap[color];
    final fgColor = foregroundColorMap[color];
    final shape =
        RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0));
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

    if (isOutlined) {
      return OutlinedButton(
        style: OutlinedButton.styleFrom(
          foregroundColor: bgColor,
          disabledBackgroundColor: Colors.black12,
          side: BorderSide(
            color: disabled ? Colors.transparent : backgroundColorMap[color]!,
            width: disabled ? 0 : 2,
          ),
          elevation: 0,
          shape: shape,
          textStyle: textStyle,
          padding: padding,
        ),
        onPressed: onClick,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: mainAxisSize,
          children: _getChildren(),
        ),
      );
    }
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: bgColor,
        foregroundColor: fgColor,
        elevation: 0, // 无阴影
        shape: shape,
        textStyle: textStyle,
        padding: padding,
      ),
      onPressed: onClick,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: mainAxisSize,
        children: _getChildren(),
      ),
    );
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
    if (isOutlined) {
      return OutlinedButton(
        onPressed: onPressed,
        style: OutlinedButton.styleFrom(
          padding: const EdgeInsets.all(16),
          side: BorderSide(
            color: bgColor,
            width: 2,
          ),
          shape: const CircleBorder(),
        ),
        child: icon,
      );
    }
    return ElevatedButton(
      onPressed: onPressed,
      style: IconButton.styleFrom(
        padding: const EdgeInsets.all(16),
        backgroundColor: bgColor,
        shape: const CircleBorder(),
      ),
      child: icon,
    );
  }
}
