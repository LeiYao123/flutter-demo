import 'package:flutter/material.dart';
import 'package:tablet/style/color.dart';

enum BtnSizeEnum { sm, md, lg }

const Map<BtnSizeEnum, double> fontSizeMap = {
  BtnSizeEnum.sm: 14,
  BtnSizeEnum.md: 16,
  BtnSizeEnum.lg: 18,
};

const Map<BtnSizeEnum, List<double>> paddingSizeMap = {
  BtnSizeEnum.sm: [16, 10],
  BtnSizeEnum.md: [16, 13],
  BtnSizeEnum.lg: [16, 17.5],
};

class RuButton extends StatelessWidget {
  final String text;
  final Color? bgColor;
  final Color? fgColor;
  final EdgeInsets? margin;
  final double? width;
  final BtnSizeEnum size;
  // 外边框，是否独占一行，禁用，loading
  final bool isOutlined, isBlock, disabled, loading;
  final Function()? onPressed;
  const RuButton(
    this.text, {
    super.key,
    this.onPressed,
    this.bgColor = RuColor.yellow,
    this.fgColor = RuColor.blackPure,
    this.size = BtnSizeEnum.md,
    this.isOutlined = false,
    this.isBlock = false,
    this.disabled = false,
    this.loading = false,
    this.margin,
    this.width,
  });

  List<Widget> _getChildren() {
    List<Widget> btnChildren = [Text(text)];
    if (loading) {
      btnChildren = [
        SizedBox(
          height: fontSizeMap[size],
          width: fontSizeMap[size],
          child: CircularProgressIndicator(
            strokeWidth: 3.0,
            valueColor: AlwaysStoppedAnimation(isOutlined ? bgColor : fgColor),
          ),
        ),
        const SizedBox(width: 8),
        Text(text)
      ];
    }
    return btnChildren;
  }

  ButtonStyle _getButtonStyle() {
    final shape = RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(8.0),
    );

    final textStyle = TextStyle(
      fontWeight: FontWeight.w700,
      fontSize: fontSizeMap[size],
    );

    final padding = EdgeInsets.symmetric(
      horizontal: paddingSizeMap[size]![0],
      vertical: paddingSizeMap[size]![1],
    );

    final backgroundColor = disabled ? RuColor.common_16 : bgColor;
    final foregroundColor = disabled ? RuColor.common_32 : fgColor;

    return ButtonStyle(
      elevation: MaterialStateProperty.all(0),
      padding: MaterialStateProperty.all(padding),
      shape: MaterialStateProperty.all(shape),
      textStyle: MaterialStateProperty.all(textStyle),
      overlayColor: isOutlined
          ? MaterialStateProperty.resolveWith<Color>(
              (states) => bgColor!.withOpacity(0.1))
          : null,
      side: isOutlined
          ? MaterialStateProperty.all(
              BorderSide(color: backgroundColor!, width: 2.0))
          : null,
      backgroundColor:
          isOutlined ? null : MaterialStateProperty.all(backgroundColor),
      foregroundColor: isOutlined
          ? MaterialStateProperty.all(backgroundColor)
          : MaterialStateProperty.all(foregroundColor),
    );
  }

  @override
  Widget build(BuildContext context) {
    final onClick = (disabled || loading) ? null : onPressed;

    final child = Row(
      mainAxisSize: MainAxisSize.min,
      children: _getChildren(),
    );

    return Container(
      margin: margin,
      width: isBlock ? double.infinity : width,
      // constraints: BoxConstraints(minWidth: 120),
      child: isOutlined
          ? OutlinedButton(
              onPressed: onClick,
              style: _getButtonStyle(),
              child: child,
            )
          : ElevatedButton(
              onPressed: onClick,
              style: _getButtonStyle(),
              child: child,
            ),
    );
  }
}

// Icon button 组件

const Map<BtnSizeEnum, double> iconBtnMap = {
  BtnSizeEnum.sm: 36,
  BtnSizeEnum.md: 48,
  BtnSizeEnum.lg: 60,
};

class RuIconButton extends StatelessWidget {
  final Widget icon;
  final Color bgColor;
  final bool isOutlined;
  final BtnSizeEnum size;
  final EdgeInsets? margin;
  final Function()? onPressed;

  const RuIconButton({
    super.key,
    required this.icon,
    required this.bgColor,
    this.onPressed,
    this.isOutlined = false,
    this.size = BtnSizeEnum.md,
    this.margin,
  });

  @override
  Widget build(BuildContext context) {
    final btnSize = iconBtnMap[size]!;
    final style = ButtonStyle(
      minimumSize: MaterialStateProperty.all(Size(btnSize, btnSize)),
      shape: MaterialStateProperty.all(const CircleBorder()),
      elevation: MaterialStateProperty.all(0),
      backgroundColor: isOutlined ? null : MaterialStateProperty.all(bgColor),
      overlayColor: isOutlined
          ? MaterialStateProperty.resolveWith<Color>(
              (states) => bgColor.withOpacity(0.1))
          : null,
      side: isOutlined
          ? MaterialStateProperty.all(BorderSide(color: bgColor, width: 2))
          : null,
    );
    return Container(
      margin: margin,
      child: isOutlined
          ? OutlinedButton(onPressed: onPressed, style: style, child: icon)
          : ElevatedButton(onPressed: onPressed, style: style, child: icon),
    );
  }
}
