import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class IconPath {
  static const LinedStar = 'assets/icons/Lined/star.svg';
  static const OrderDash = 'assets/icons/Order/DoorDash.svg';
  static const PaymentVisa = 'assets/icons/Payment/Visa.svg';
  static const SolidStar = 'assets/icons/Solid/star.svg';
  static const TrafficDirect = 'assets/icons/Traffic/Direct.svg';

  static const Asap = 'assets/icons/OrderStatus/ASAP.svg';
  static const Complete = 'assets/icons/OrderStatus/Complete.svg';
  static const Confirmed = 'assets/icons/OrderStatus/Confirmed.svg';
  static const Ready = 'assets/icons/OrderStatus/Ready.svg';
  static const Rejected = 'assets/icons/OrderStatus/Rejected.svg';
  static const Scheduled = 'assets/icons/OrderStatus/Scheduled.svg';

  static const calendar = 'assets/icons/t/calendar.svg';
  static const cateringbag = 'assets/icons/t/cateringbag.svg';
  static const clipboard = 'assets/icons/t/clipboard.svg';
  static const menu = 'assets/icons/t/menu.svg';
  static const receipt = 'assets/icons/t/receipt.svg';
  static const utensils = 'assets/icons/t/utensils.svg';
  static const checked_false = 'assets/icons/t/CheckedFalse.svg';
  static const checked_true = 'assets/icons/t/CheckedTrue.svg';
  static const adjustments = 'assets/icons/t/adjustments.svg';
}

Widget RIcons(
  String svgName, {
  double size = 24,
  Color? color,
}) {
  return SvgPicture.asset(
    svgName,
    width: size,
    height: size,
    colorFilter:
        color != null ? ColorFilter.mode(color, BlendMode.srcIn) : null,
  );
}
