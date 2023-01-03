import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../home/index.controller.dart';

class Other extends StatelessWidget {
  Other({super.key});

  final HomeController c = Get.find();

  @override
  Widget build(BuildContext context) {
    final result = Get.arguments['title'];
    print('resu lt--> $result');
    return Scaffold(
      appBar: AppBar(
        title: Text(result),
      ),
      body: Center(
          child: Column(
        children: [
          Text(
            '${c.count}',
            style: Theme.of(context).textTheme.headline1,
          ),
          Obx(() => Text('Obx监听的 ${c.count}')),
          ElevatedButton(
              onPressed: () {
                c.add();
              },
              child: const Text('add'))
        ],
      )),
    );
  }
}
