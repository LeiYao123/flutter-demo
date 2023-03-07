import 'package:flutter/material.dart';

import 'index.dart';

class OrderODDProgressDemo extends StatelessWidget {
  const OrderODDProgressDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          color: Colors.white,
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: const [
              OrderODDProgress(progress: ProgressEnum.confirming),
              SizedBox(height: 24),
              OrderODDProgress(progress: ProgressEnum.assigning),
              SizedBox(height: 24),
              OrderODDProgress(
                  progress: ProgressEnum.driver_assigned,
                  name: 'Marvin McKinney'),
              SizedBox(height: 24),
              OrderODDProgress(
                  progress: ProgressEnum.store_arrival,
                  name: 'Marvin McKinney'),
              SizedBox(height: 24),
              OrderODDProgress(
                  progress: ProgressEnum.routing, name: 'Marvin McKinney'),
              SizedBox(height: 24),
              OrderODDProgress(
                  progress: ProgressEnum.arrived, name: 'Marvin McKinney'),
              SizedBox(height: 24),
              OrderODDProgress(
                  progress: ProgressEnum.completed, name: 'Marvin McKinney'),
              SizedBox(height: 24),
              OrderODDProgress(progress: ProgressEnum.error),
            ],
          ),
        ),
      ),
    );
  }
}
