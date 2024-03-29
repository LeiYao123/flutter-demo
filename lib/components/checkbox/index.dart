import 'package:flutter/material.dart';
import 'package:tablet/style/color.dart';
import 'package:tablet/style/icons.dart';

class RCheckbox extends StatelessWidget {
  final bool? isSingle;
  final bool checked;
  final Widget? left;
  final Widget? right;
  final void Function(bool) onChanged;
  const RCheckbox({
    super.key,
    this.isSingle = false,
    required this.checked,
    required this.onChanged,
    this.left,
    this.right,
  });

  // 单独的 checkbox
  Widget _buildSingleCheckbox() {
    final path = checked ? IconPath.checked_true : IconPath.checked_false;
    return left == null
        ? RIcons(path)
        : Row(
            children: [RIcons(path), const SizedBox(width: 8), left!],
          );
  }

  // order time selector
  Widget _buildCheckboxSelector() {
    return Container(
      padding: const EdgeInsets.all(16),
      margin: EdgeInsets.all(checked ? 0 : 1),
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(8.0)),
        border: Border.all(
          color: checked ? RColor.light_common_100 : RColor.light_common_8,
          width: checked ? 2 : 1,
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _buildSingleCheckbox(),
          if (right != null) right!,
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => onChanged(!checked),
      borderRadius: const BorderRadius.all(Radius.circular(8.0)),
      child: isSingle! ? _buildSingleCheckbox() : _buildCheckboxSelector(),
    );
  }
}
