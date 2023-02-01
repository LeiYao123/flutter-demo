import 'package:flutter/material.dart';
import 'package:tablet/components/text.dart';

class RuCheckbox extends StatelessWidget {
  const RuCheckbox({
    super.key,
    required this.label,
    this.padding,
    required this.value,
    required this.onChanged,
  });

  final String label;
  final EdgeInsets? padding;
  final dynamic value;
  final ValueChanged onChanged;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        onChanged(!value);
      },
      child: Padding(
        padding: padding ?? const EdgeInsets.all(0),
        child: Row(
          children: <Widget>[
            SizedBox(
              width: 20,
              child: Checkbox(
                value: value,
                onChanged: (newValue) {
                  onChanged(newValue!);
                },
              ),
            ),
            const SizedBox(width: 12),
            RuText(label),
          ],
        ),
      ),
    );
  }
}
