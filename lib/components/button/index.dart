import 'package:flutter/material.dart';
import 'package:tablet/style/color.dart';

enum BtnSizeEnum { sm, md, lg }

const Map<BtnSizeEnum, double> fontSizeMap = {
  BtnSizeEnum.sm: 14,
  BtnSizeEnum.md: 16,
  BtnSizeEnum.lg: 18,
};

const Map<BtnSizeEnum, double> heightMap = {
  BtnSizeEnum.sm: 36,
  BtnSizeEnum.md: 48,
  BtnSizeEnum.lg: 60,
};

class RButton extends StatelessWidget {
  final String text;

  /// 自定义 child 否则使用 text
  final Widget? child;
  final Color? bgColor;
  final Color? fgColor;
  final EdgeInsets? margin;
  final double? width;
  final BtnSizeEnum size;

  final Function()? onPressed;

  /// 外边框，是否独占一行，禁用，loading
  final bool isOutlined, isBlock, disabled, loading;
  const RButton(
    this.text, {
    super.key,
    this.child,
    this.onPressed,
    this.bgColor = RColor.yellow,
    this.fgColor = RColor.black_pure,
    this.size = BtnSizeEnum.md,
    this.margin,
    this.width,
    this.isOutlined = false,
    this.isBlock = false,
    this.disabled = false,
    this.loading = false,
  });

  Widget _getBtnChild() {
    Widget child = Text(text);
    if (loading) {
      child = Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(
            width: fontSizeMap[size],
            height: fontSizeMap[size],
            child: CircularProgressIndicator(
              strokeWidth: 3.0,
              valueColor:
                  AlwaysStoppedAnimation(isOutlined ? bgColor : fgColor),
            ),
          ),
          const SizedBox(width: 8),
          Text(text)
        ],
      );
    }
    return child;
  }

  ButtonStyle _getButtonStyle() {
    final shape = RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(8.0),
    );

    final textStyle = TextStyle(
      fontWeight: FontWeight.w700,
      fontSize: fontSizeMap[size],
    );

    const padding = EdgeInsets.symmetric(horizontal: 16);

    final backgroundColor = disabled ? RColor.light_common_16 : bgColor;
    final foregroundColor = disabled ? RColor.light_common_32 : fgColor;

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

    return Container(
      margin: margin,
      width: isBlock ? double.infinity : width,
      height: heightMap[size],
      // constraints: BoxConstraints(minWidth: 120),
      child: isOutlined
          ? OutlinedButton(
              onPressed: onClick,
              style: _getButtonStyle(),
              child: child ?? _getBtnChild(),
            )
          : ElevatedButton(
              onPressed: onClick,
              style: _getButtonStyle(),
              child: child ?? _getBtnChild(),
            ),
    );
  }
}

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
    final style = ButtonStyle(
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
      width: heightMap[size]!,
      height: heightMap[size]!,
      margin: margin,
      child: isOutlined
          ? OutlinedButton(onPressed: onPressed, style: style, child: icon)
          : ElevatedButton(onPressed: onPressed, style: style, child: icon),
    );
  }
}


// 直接通过 ButtonStyle 设置按钮尺寸
// minimumSize: MaterialStateProperty.all(Size(btnSize, btnSize)),

// const Map<BtnSizeEnum, List<double>> paddingSizeMap = {
//   BtnSizeEnum.sm: [16, 10],
//   BtnSizeEnum.md: [16, 13],
//   BtnSizeEnum.lg: [16, 17.5],
//   // BtnSizeEnum.sm: [16, 10],
//   // BtnSizeEnum.md: [16, 13],
//   // BtnSizeEnum.lg: [16, 17.5],
// };