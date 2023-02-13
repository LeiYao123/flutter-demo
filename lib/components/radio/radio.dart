import 'package:flutter/material.dart';
import 'package:tablet/components/text/text.dart';

class RuRadio extends StatelessWidget {
  const RuRadio({
    super.key,
    required this.label,
    this.padding,
    required this.groupValue,
    required this.value,
    required this.onChanged,
  });

  final String label;
  final EdgeInsets? padding;
  final String groupValue;
  final String value;
  final ValueChanged<String> onChanged;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        if (value != groupValue) {
          onChanged(value);
        }
      },
      child: Padding(
        padding: padding ?? const EdgeInsets.all(0),
        child: Row(
          children: <Widget>[
            SizedBox(
              width: 20,
              child: Radio(
                groupValue: groupValue,
                value: value,
                onChanged: (String? newValue) {
                  onChanged(newValue!);
                },
              ),
            ),
            const SizedBox(width: 12),
            RuText(label, isBold: true),
          ],
        ),
      ),
    );
  }
}
