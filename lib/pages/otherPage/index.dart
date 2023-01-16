import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tablet/store/test.controller.dart';

class Other extends StatelessWidget {
  Other({super.key});
  // 必须先通过 Get.put 实例化之后才可以使用 Get.find
  final TestController tc = Get.find();

  // final TestController tc = Get.put(TestController());

  @override
  Widget build(BuildContext context) {
    final result = Get.arguments['title'];
    print('resu lt--> $result');
    return Scaffold(
      appBar: AppBar(
        title: Text(result),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: Column(
            children: [
              Text('直接获取-${tc.count}'),
              Obx(() => Text('Obx监听获取 ${tc.count}')),
              GetBuilder<TestController>(builder: (co) {
                return Text('GetBuilder 方式获取 ${co.count}');
              }),
              ElevatedButton(
                onPressed: () => tc.sub(),
                child: const Text('sub'),
              )
            ],
          ),
        ),
      ),
    );
  }
}
