import 'package:flutter/material.dart';

class OrientationDemo extends StatelessWidget {
  const OrientationDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('横竖屏切换')),
      body: OrientationBuilder(builder: (context, orientation) {
        return Center(
          child: Flex(
            direction: orientation == Orientation.landscape
                ? Axis.horizontal
                : Axis.vertical,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              for (int i = 0; i < 5; i++)
                Container(
                  width: 80,
                  height: 80,
                  color: Colors.blue,
                  alignment: Alignment.center,
                  child: Text(i.toString()),
                )
            ],
          ),
        );
      }),
    );
  }
}
