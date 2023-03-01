import 'package:flutter/material.dart';
import 'package:tablet/components/text/index.dart';

import 'index.dart';

class CheckboxDemo extends StatefulWidget {
  const CheckboxDemo({super.key});

  @override
  State<CheckboxDemo> createState() => _CheckboxDemoState();
}

class _CheckboxDemoState extends State<CheckboxDemo> {
  bool _isRemember = false;
  bool _isRemember2 = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('checkbox')),
      body: Padding(
        padding: const EdgeInsets.all(32.0),
        child: Column(
          children: [
            RuCheckbox(
              checked: _isRemember,
              left: const RuText('6:05 PM', weight: FontWeight.w500),
              right: const RuText('5 minutes'),
              onChanged: (value) => setState(() => _isRemember = value),
            ),
            const SizedBox(height: 30),
            RuCheckbox(
              checked: _isRemember2,
              left: Row(
                children: [
                  const RuText('7:12 PM', weight: FontWeight.w500),
                  const SizedBox(width: 8),
                  Ink(
                    child: GestureDetector(
                      behavior: HitTestBehavior.opaque,
                      onTap: () {
                        print('change');
                      },
                      child: const RuText(
                        'CHANGE',
                        weight: FontWeight.w500,
                        color: Colors.blue,
                      ),
                    ),
                  ),
                ],
              ),
              right: const RuText('5 minutes'),
              onChanged: (value) => setState(() => _isRemember2 = value),
            ),
            const SizedBox(height: 30),
            RuCheckbox(
              checked: _isRemember,
              left: const RuText('Option 1', weight: FontWeight.w500),
              onChanged: (value) => setState(() => _isRemember = value),
            ),
            const SizedBox(height: 30),
            RuCheckbox(
              isSingle: true,
              left: const RuText('Remember Me'),
              checked: _isRemember,
              onChanged: (value) => setState(() => _isRemember = value),
            ),
          ],
        ),
      ),
    );
  }
}
