import 'package:flutter/material.dart';

import 'index.dart';

class OrderOLOStatusDemo extends StatelessWidget {
  const OrderOLOStatusDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('order olo status demo')),
      body: Padding(
        padding: const EdgeInsets.all(32.0),
        child: Column(
          children: [
            OrderOLOStatus(
              isOpen: true,
              time: '9:45 PM',
              onPressed: () {
                print('open');
              },
            ),
            const SizedBox(height: 16),
            OrderOLOStatus(
              isOpen: false,
              time: 'Jul 20 @ 11:00 AM',
              onPressed: () {
                print('closed');
              },
            ),
          ],
        ),
      ),
    );
  }
}
