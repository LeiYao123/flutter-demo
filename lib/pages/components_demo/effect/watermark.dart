import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';

class WaterMarkDemo extends StatelessWidget {
  const WaterMarkDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('水印效果')),
      body: Center(
        child: Container(
          width: 300,
          height: 300,
          color: Colors.amberAccent,
          child: Stack(
            fit: StackFit.expand,
            children: [
              ImageFiltered(
                  imageFilter: ImageFilter.blur(
                    sigmaX: 2,
                    sigmaY: 2,
                  ),
                  child: const FlutterLogo()),
              Positioned(
                child: Center(
                  child: Transform.rotate(
                    angle: -pi / 4,
                    child: const AspectRatio(
                      aspectRatio: 1 / 1,
                      child: FittedBox(
                        child: Text('Hello world123 \n 大大大句子'),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// child: Stack(
//   // 控制所有非 positioned 的 children 越大越好
//   // fit: StackFit.expand,
//   children: [
//     child,
//     // Center(
//     //   child: Container(
//     //     width: 300,
//     //     height: 300,
//     //     child: ImageFiltered(
//     //       imageFilter: ImageFilter.blur(sigmaX: 2, sigmaY: 2),
//     //       child: const FlutterLogo(),
//     //     ),
//     //   ),
//     // ),
//   ],
