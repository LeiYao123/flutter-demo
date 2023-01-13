import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tablet/routes/index.dart';
import 'package:tablet/store/test.controller.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
        backgroundColor: const Color(0xFFFFB800),
      ),
      body: TestWidget(),
    );
  }
}

class TestWidget extends StatelessWidget {
  TestWidget({super.key});

  // 使用 Get.put 实例化你的类，使其对当下的所有子路由可用
  final TestController tc = Get.put(TestController());
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Center(
        child: SizedBox(
          width: 400,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // 使用 Obx 每当改变计数时就会自动更新 text
              Obx(() => Text('Obx 控制clicks: ${tc.count}')),
              GetX<TestController>(builder: (co) {
                return Text('GetX 控制 ${co.count}');
              }),
              GetBuilder<TestController>(builder: (co) {
                return Text('GetBuilder 控制 ${co.count}');
              }),
              const Divider(),
              Wrap(
                spacing: 12,
                children: [
                  ElevatedButton(
                    onPressed: () => tc.add(),
                    child: const Text('Obx => add 操作'),
                  ),
                  ElevatedButton(
                    onPressed: () => tc.sub(),
                    child: const Text('GetBuilder => sub 操作'),
                  ),
                ],
              ),
              const Divider(),
              Wrap(
                spacing: 12,
                children: [
                  ElevatedButton(
                    child: const Text('login page'),
                    onPressed: () => Get.offNamed(AppRoutes.login),
                  ),
                  ElevatedButton(
                    child: const Text('GetX store page'),
                    onPressed: () => Get.toNamed(AppRoutes.other,
                        arguments: {'title': '路由传参'}),
                  ),
                  ElevatedButton(
                    child: const Text('icons demo'),
                    onPressed: () => Get.toNamed(AppRoutes.icons),
                  ),
                  ElevatedButton(
                    child: const Text('button demo'),
                    onPressed: () => Get.toNamed(AppRoutes.button),
                  ),
                  ElevatedButton(
                    child: const Text('test widget'),
                    onPressed: () => Get.toNamed(AppRoutes.test),
                  ),
                ],
              ),
              const Divider(),
              Wrap(
                spacing: 12,
                children: [
                  ElevatedButton(
                    onPressed: () =>
                        Get.snackbar('I am snackbar', 'i am message'),
                    child: const Text('snackbar'),
                  ),
                  ElevatedButton(
                    onPressed: () => Get.defaultDialog(),
                    child: const Text('default dialog'),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Get.bottomSheet(
                        Container(
                          width: 300,
                          height: 300,
                          alignment: Alignment.center,
                          color: Colors.white,
                          child: const Text('data'),
                        ),
                      );
                    },
                    child: const Text('bottomSheet'),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
