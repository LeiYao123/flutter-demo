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
            RCheckbox(
              checked: _isRemember,
              left: const RText('6:05 PM', weight: FontWeight.w500),
              right: const RText('5 minutes'),
              onChanged: (value) => setState(() => _isRemember = value),
            ),
            const SizedBox(height: 30),
            RCheckbox(
              checked: _isRemember2,
              left: Row(
                children: [
                  const RText('7:12 PM', weight: FontWeight.w500),
                  const SizedBox(width: 8),
                  Ink(
                    child: GestureDetector(
                      behavior: HitTestBehavior.opaque,
                      onTap: () {
                        print('change');
                      },
                      child: const RText(
                        'CHANGE',
                        weight: FontWeight.w500,
                        color: Colors.blue,
                      ),
                    ),
                  ),
                ],
              ),
              right: const RText('5 minutes'),
              onChanged: (value) => setState(() => _isRemember2 = value),
            ),
            const SizedBox(height: 30),
            RCheckbox(
              checked: _isRemember,
              left: const RText('Option 1', weight: FontWeight.w500),
              onChanged: (value) => setState(() => _isRemember = value),
            ),
            const SizedBox(height: 30),
            RCheckbox(
              isSingle: true,
              left: const RText('Remember Me'),
              checked: _isRemember,
              onChanged: (value) => setState(() => _isRemember = value),
            ),
          ],
        ),
      ),
    );
  }
}
